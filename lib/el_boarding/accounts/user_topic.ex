defmodule ElBoarding.Accounts.UserTopic do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElBoarding.Accounts.UserItem


  schema "user_topics" do
    belongs_to :topic, Topic
    belongs_to :user, User

    has_many :user_items, UserItem

    timestamps()
  end

  @doc false
  def changeset(user_topic, attrs) do
    user_topic
    |> cast(attrs, [])
    |> validate_required([])
  end
end
