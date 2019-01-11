defmodule ElBoardingWeb.Router do
  use ElBoardingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElBoardingWeb do
    pipe_through :api
  end

  scope "/auth", ElBoarding do
#    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end
end
