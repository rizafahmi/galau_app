# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :galau_app,
  ecto_repos: [GalauApp.Repo]

# Configures the endpoint
config :galau_app, GalauAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SyzRWmuXn0wB7vJDZJbcjrbjfvgIvIWuFak7Ld5l/EiQOP/5eAKImbhT1jv19O2O",
  render_errors: [view: GalauAppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GalauApp.PubSub,
  live_view: [signing_salt: "qxLxXwEh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
