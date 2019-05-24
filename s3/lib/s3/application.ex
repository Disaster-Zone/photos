defmodule S3.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # List all child processes to be supervised
    children = [
      supervisor(S3.Blob, [])
      # Starts a worker by calling: Db.Worker.start_link(arg)
      # {Db.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: S3.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
