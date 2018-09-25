defmodule Apiserver.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Apiserver.Worker.start_link(arg)
      # {Apiserver.Worker, arg},
      Apiserver.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Apiserver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
