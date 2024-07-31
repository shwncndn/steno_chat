defmodule StenoChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StenoChatWeb.Telemetry,
      StenoChat.Repo,
      {DNSCluster, query: Application.get_env(:steno_chat, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: StenoChat.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: StenoChat.Finch},
      # Start a worker by calling: StenoChat.Worker.start_link(arg)
      # {StenoChat.Worker, arg},
      # Start to serve requests, typically the last entry
      StenoChatWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StenoChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StenoChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
