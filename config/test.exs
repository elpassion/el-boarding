use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :el_boarding, ElBoardingWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :el_boarding, ElBoarding.Repo,
  username: "postgres",
  password: "postgres",
  database: "el_boarding_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
