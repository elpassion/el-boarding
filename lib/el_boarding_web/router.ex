defmodule ElBoardingWeb.Router do
  use ElBoardingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: ElBoardingWeb.Schema

    if Mix.env == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: ElBoardingWeb.Schema
    end
  end
end
