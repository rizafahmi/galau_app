defmodule GalauApp.Repo do
  use Ecto.Repo,
    otp_app: :galau_app,
    adapter: Ecto.Adapters.Postgres
end
