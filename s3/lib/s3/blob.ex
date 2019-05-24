defmodule S3.Blob do
  def list_container(_container) do
  end

  def put_blob(container, file, blob_name) do
    {:ok, image} =
      ExAws.S3.put_object(container, blob_name, file, acl: :public_read)
      |> ExAws.request()
  end
end
