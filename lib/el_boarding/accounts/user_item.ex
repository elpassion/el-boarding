defmodule ElBoarding.Accounts.UserItem do
  use Ecto.Schema
  import Ecto.Changeset


  schema "user_items" do
    field :done, :boolean, default: false

    belongs_to :item, Item
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(user_item, attrs) do
    user_item
    |> cast(attrs, [:done])
    |> validate_required([:done])
  end
end
