defmodule Dascord.Repo do
  use Ecto.Repo,
    otp_app: :dascord,
    adapter: Ecto.Adapters.Postgres
end
