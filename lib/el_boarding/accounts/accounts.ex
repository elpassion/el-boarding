defmodule ElBoarding.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias ElBoarding.Repo

  alias ElBoarding.Accounts.User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias ElBoarding.Accounts.UserItem
  alias ElBoarding.Activities.Item
  alias ElBoarding.Activities.Topic


  def list_user_items do
    Repo.all(UserItem)
  end

  def get_user_item!(id), do: Repo.get!(UserItem, id)

  def create_user_item(%User{} = user, %Item{} = item, attrs \\ %{}) do
    %UserItem{}
    |> UserItem.changeset(attrs)
    |> Ecto.Changeset.put_change(:user_id, user.id)
    |> Ecto.Changeset.put_change(:item_id, item.id)
    |> Repo.insert()
  end

  def update_user_item(%UserItem{} = user_item, attrs) do
    user_item
    |> UserItem.changeset(attrs)
    |> Repo.update()
  end

  def delete_user_item(%UserItem{} = user_item) do
    Repo.delete(user_item)
  end

  def change_user_item(%UserItem{} = user_item) do
    UserItem.changeset(user_item, %{})
  end

  alias ElBoarding.Accounts.UserTopic

  def list_user_topics do
    Repo.all(UserTopic)
  end

  def get_user_topic!(id), do: Repo.get!(UserTopic, id)

  def create_user_topic(%User{} = user, %Topic{} = topic, attrs \\ %{}) do
    %UserTopic{}
    |> UserTopic.changeset(attrs)
    |> Ecto.Changeset.put_change(:user_id, user.id)
    |> Ecto.Changeset.put_change(:topic_id, topic.id)
    |> Repo.insert()
  end

  def update_user_topic(%UserTopic{} = user_topic, attrs) do
    user_topic
    |> UserTopic.changeset(attrs)
    |> Repo.update()
  end

  def delete_user_topic(%UserTopic{} = user_topic) do
    Repo.delete(user_topic)
  end

  def change_user_topic(%UserTopic{} = user_topic) do
    UserTopic.changeset(user_topic, %{})
  end
end
