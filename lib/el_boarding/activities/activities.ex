defmodule ElBoarding.Activities do

  import Ecto.Query, warn: false

  alias ElBoarding.Repo
  alias ElBoarding.Activities.Topic
  alias ElBoarding.Activities.Item

  def list_topics do
    Repo.all(Topic)
  end

  def get_topic!(id), do: Repo.get!(Topic, id)

  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  def update_topic(%Topic{} = topic, attrs) do
    topic
    |> Topic.changeset(attrs)
    |> Repo.update()
  end

  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  def change_topic(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end


  def list_items() do
    Repo.all(Item)
  end

  def list_topic_items(topic_id) do
     Repo.all(from i in Item,
             where: i.topic_id == ^topic_id,
             select: i)
  end

  def get_item!(id), do: Repo.get!(Item, id)

  def create_item(%Topic{} = topic, attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Ecto.Changeset.put_change(:topic_id, topic.id)
    |> Repo.insert()
  end

  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  def change_item(%Item{} = item) do
    Item.changeset(item, %{})
  end
end
