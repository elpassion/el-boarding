defmodule ElBoarding.Repo do
  use Ecto.Repo,
    otp_app: :el_boarding,
    adapter: Ecto.Adapters.Postgres
end
