defmodule S3.Sign do
  def sign_url(http_method, url, region, service) do
    sign(
      Application.fetch_env!(:ex_aws, :access_key_id),
      Application.fetch_env!(:ex_aws, :secret_access_key),
      http_method,
      url,
      region,
      service,
      Map.new(),
      current_time(),
      ""
    )
  end

  # http://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html
  defp sign(
         access_key,
         secret_key,
         http_method,
         url,
         region,
         service,
         headers,
         request_time,
         payload
       ) do
    uri = URI.parse(url)

    http_method = String.upcase(http_method)
    region = String.downcase(region)
    service = String.downcase(service)

    headers = Map.put_new(headers, "host", uri.host)

    amz_date = request_time |> S3.Utils.format_time()
    date = request_time |> S3.Utils.format_date()

    scope = "#{date}/#{region}/#{service}/aws4_request"

    params =
      case uri.query do
        nil ->
          Map.new()

        _ ->
          URI.decode_query(uri.query)
      end

    params =
      params
      |> Map.put("X-Amz-Algorithm", "AWS4-HMAC-SHA256")
      |> Map.put("X-Amz-Credential", "#{access_key}/#{scope}")
      |> Map.put("X-Amz-Date", amz_date)
      |> Map.put("X-Amz-Expires", "86400")
      |> Map.put("X-Amz-SignedHeaders", "#{Map.keys(headers) |> Enum.join(";")}")

    hashed_payload =
      if service == "s3",
        do: :unsigned,
        else: S3.Utils.hash_sha256(payload)

    string_to_sign =
      S3.Utils.build_canonical_request(http_method, uri.path, params, headers, hashed_payload)
      |> S3.Utils.build_string_to_sign(amz_date, scope)

    signature =
      S3.Utils.build_signing_key(secret_key, date, region, service)
      |> S3.Utils.build_signature(string_to_sign)

    params = params |> Map.put("X-Amz-Signature", signature)
    query_string = URI.encode_query(params) |> String.replace("+", "%20")

    "#{uri.scheme}://#{uri.authority}#{uri.path || "/"}?#{query_string}"
  end

  defp current_time do
    DateTime.utc_now() |> DateTime.to_naive()
  end
end
