defmodule OrderedBroadway.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: OrderedBroadway.Worker.start_link(arg)
      # {OrderedBroadway.Worker, arg}
      {Pipeline, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    # opts = [strategy: :one_for_one, name: OrderedBroadway.Supervisor]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
