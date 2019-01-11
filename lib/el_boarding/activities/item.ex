defmodule ElBoarding.Activities.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElBoarding.Accounts.UserItem


  schema "items" do
    field :description, :string
    field :done, :boolean, default: false
    field :title, :string

    belongs_to :topic, Topic
    has_many :user_items, UserItem

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :description, :done])
    |> validate_required([:title, :description, :done])
  end
end