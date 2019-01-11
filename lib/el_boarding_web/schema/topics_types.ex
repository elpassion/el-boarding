defmodule ElBoardingWeb.Schema.TopicsTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: ElBoarding.Repo

  object :topic do
    field :id, non_null(:id)
    field :title, :string
    field :description, :string
    field :items, list_of(:item), resolve: assoc(:items)

    field :inserted_at, non_null(:string)
    field :updated_at, non_null(:string)
  end
end