defmodule ElBoarding.Activities.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElBoarding.Activities.Item

  schema "topics" do
    field :description, :string
    field :title, :string

    has_many :items, Item
    has_many :user_topics, UserTopic
    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
