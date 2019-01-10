defmodule ElBoardingWeb.Router do
  use ElBoardingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElBoardingWeb do
    pipe_through :api
  end
end
