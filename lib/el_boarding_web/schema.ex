defmodule ElBoardingWeb.Schema do
  use Absinthe.Schema

  alias ElBoardingWeb.Resolvers

  import_types __MODULE__.TopicsTypes
  import_types __MODULE__.ItemsTypes
  import_types __MODULE__.UsersTypes

  query do
    @desc "Get list of topics"
    field :topics, list_of(:topic) do
      #      middleware Middleware.Authorize
      resolve &Resolvers.Activities.topics/3
    end

    @desc "Get list of topics"
    field :topic_items, list_of(:item) do
      arg :topic_id, non_null(:id)
      #      middleware Middleware.Authorize
      resolve &Resolvers.Activities.topic_items/3
    end

    @desc "Get user and dependencies"
    field :user, list_of(:user) do
      arg :user_id, non_null(:id)

      resolve &Resolvers.Accounts.user/3
    end
  end
end
