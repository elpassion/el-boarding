defmodule ElBoardingWeb.Schema.UsersTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: ElBoarding.Repo

  object :user do
    field :id, non_null(:id)
    field :email, :string
    field :topics, list_of(:topic), resolve: assoc(:topics)

    field :inserted_at, non_null(:string)
    field :updated_at, non_null(:string)
  end
end