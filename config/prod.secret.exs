use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :el_boarding, ElBoardingWeb.Endpoint,
  secret_key_base: "ka9aAG5U20hcn7m509PQn1XuWEuScx9TDpvU9uj+eOp2eBDQZHGGFDjxqFPAgLXT"

# Configure your database
config :el_boarding, ElBoarding.Repo,
  username: "postgres",
  password: "postgres",
  database: "el_boarding_prod",
  pool_size: 15
