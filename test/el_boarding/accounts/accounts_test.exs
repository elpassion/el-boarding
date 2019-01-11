defmodule ElBoarding.AccountsTest do
  use ElBoarding.DataCase

  alias ElBoarding.Accounts

  describe "users" do
    alias ElBoarding.Accounts.User

    @valid_attrs %{email: "some email"}
    @update_attrs %{email: "some updated email"}
    @invalid_attrs %{email: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "user_items" do
    alias ElBoarding.Accounts.UserItem

    @valid_attrs %{done: true}
    @update_attrs %{done: false}
    @invalid_attrs %{done: nil}

    def user_item_fixture(attrs \\ %{}) do
      {:ok, user_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_item()

      user_item
    end

    test "list_user_items/0 returns all user_items" do
      user_item = user_item_fixture()
      assert Accounts.list_user_items() == [user_item]
    end

    test "get_user_item!/1 returns the user_item with given id" do
      user_item = user_item_fixture()
      assert Accounts.get_user_item!(user_item.id) == user_item
    end

    test "create_user_item/1 with valid data creates a user_item" do
      assert {:ok, %UserItem{} = user_item} = Accounts.create_user_item(@valid_attrs)
      assert user_item.done == true
    end

    test "create_user_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_item(@invalid_attrs)
    end

    test "update_user_item/2 with valid data updates the user_item" do
      user_item = user_item_fixture()
      assert {:ok, %UserItem{} = user_item} = Accounts.update_user_item(user_item, @update_attrs)
      assert user_item.done == false
    end

    test "update_user_item/2 with invalid data returns error changeset" do
      user_item = user_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_item(user_item, @invalid_attrs)
      assert user_item == Accounts.get_user_item!(user_item.id)
    end

    test "delete_user_item/1 deletes the user_item" do
      user_item = user_item_fixture()
      assert {:ok, %UserItem{}} = Accounts.delete_user_item(user_item)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_item!(user_item.id) end
    end

    test "change_user_item/1 returns a user_item changeset" do
      user_item = user_item_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_item(user_item)
    end
  end

  describe "user_topics" do
    alias ElBoarding.Accounts.UserTopic

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_topic_fixture(attrs \\ %{}) do
      {:ok, user_topic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_topic()

      user_topic
    end

    test "list_user_topics/0 returns all user_topics" do
      user_topic = user_topic_fixture()
      assert Accounts.list_user_topics() == [user_topic]
    end

    test "get_user_topic!/1 returns the user_topic with given id" do
      user_topic = user_topic_fixture()
      assert Accounts.get_user_topic!(user_topic.id) == user_topic
    end

    test "create_user_topic/1 with valid data creates a user_topic" do
      assert {:ok, %UserTopic{} = user_topic} = Accounts.create_user_topic(@valid_attrs)
    end

    test "create_user_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_topic(@invalid_attrs)
    end

    test "update_user_topic/2 with valid data updates the user_topic" do
      user_topic = user_topic_fixture()
      assert {:ok, %UserTopic{} = user_topic} = Accounts.update_user_topic(user_topic, @update_attrs)
    end

    test "update_user_topic/2 with invalid data returns error changeset" do
      user_topic = user_topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_topic(user_topic, @invalid_attrs)
      assert user_topic == Accounts.get_user_topic!(user_topic.id)
    end

    test "delete_user_topic/1 deletes the user_topic" do
      user_topic = user_topic_fixture()
      assert {:ok, %UserTopic{}} = Accounts.delete_user_topic(user_topic)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_topic!(user_topic.id) end
    end

    test "change_user_topic/1 returns a user_topic changeset" do
      user_topic = user_topic_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_topic(user_topic)
    end
  end
end
