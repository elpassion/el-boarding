defmodule ElBoarding.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElBoarding.Accounts.UserItem
  alias ElBoarding.Accounts.UserTopic
  alias ElBoarding.Activities.Item

  schema "users" do
    field :email, :string

    many_to_many :topics, ElBoarding.Activities.Topic, join_through: "user_topics"
    has_many :user_items, UserItem

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
