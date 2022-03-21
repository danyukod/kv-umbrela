defmodule Kv.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Kv.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Kv.PubSub}
      # Start a worker by calling: Kv.Worker.start_link(arg)
      # {Kv.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Kv.Supervisor)
  end
end
