defmodule ElBoardingWeb.Schema.ItemsTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: ElBoarding.Repo

  object :user_item do
    field :id, non_null(:id)
    field :user_id, non_null(:id)
    field :item_id, non_null(:id)
    field :done, :boolean
  end

  object :item do
    field :id, non_null(:id)
    field :title, :string
    field :description, :string
    field :user_items, list_of(:user_item), resolve: assoc(:user_items)

    field :inserted_at, non_null(:string)
    field :updated_at, non_null(:string)
  end
end