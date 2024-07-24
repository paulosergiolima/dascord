defmodule Dascord.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DascordWeb.Telemetry,
      Dascord.Repo,
      {DNSCluster, query: Application.get_env(:dascord, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Dascord.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Dascord.Finch},
      # Start a worker by calling: Dascord.Worker.start_link(arg)
      # {Dascord.Worker, arg},
      # Start to serve requests, typically the last entry
      DascordWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dascord.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DascordWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
