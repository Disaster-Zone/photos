defmodule S3 do
  defdelegate list_container(container), to: S3.Blob
  defdelegate put_blob(container, file, blob_name), to: S3.Blob
  defdelegate sign_url(http_method, url, region, service), to: S3.Sign
end
