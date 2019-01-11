# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :el_boarding,
  ecto_repos: [ElBoarding.Repo]

# Configures the endpoint
config :el_boarding, ElBoardingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cLJi1dAbPyvf/n1U37HBrwGB4ZZcrnirOwpPb1p0PEGSFMnHEQoyDHNkQ9/S51tG",
  render_errors: [view: ElBoardingWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ElBoarding.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
