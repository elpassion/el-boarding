defmodule ElBoarding.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElBoarding.Accounts.UserItem
  alias ElBoarding.Accounts.UserTopic

  schema "users" do
    field :email, :string

    has_many :user_topics, UserTopic
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
