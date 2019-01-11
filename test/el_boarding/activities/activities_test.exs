defmodule ElBoarding.ActivitiesTest do
  use ElBoarding.DataCase

  alias ElBoarding.Activities

  describe "topics" do
    alias ElBoarding.Activities.Topic

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def topic_fixture(attrs \\ %{}) do
      {:ok, topic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Activities.create_topic()

      topic
    end

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert Activities.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Activities.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      assert {:ok, %Topic{} = topic} = Activities.create_topic(@valid_attrs)
      assert topic.description == "some description"
      assert topic.title == "some title"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activities.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{} = topic} = Activities.update_topic(topic, @update_attrs)
      assert topic.description == "some updated description"
      assert topic.title == "some updated title"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Activities.update_topic(topic, @invalid_attrs)
      assert topic == Activities.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Activities.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Activities.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Activities.change_topic(topic)
    end
  end

  describe "items" do
    alias ElBoarding.Activities.Item

    @valid_attrs %{description: "some description", done: true, title: "some title"}
    @update_attrs %{description: "some updated description", done: false, title: "some updated title"}
    @invalid_attrs %{description: nil, done: nil, title: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Activities.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Activities.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Activities.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Activities.create_item(@valid_attrs)
      assert item.description == "some description"
      assert item.done == true
      assert item.title == "some title"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activities.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Activities.update_item(item, @update_attrs)
      assert item.description == "some updated description"
      assert item.done == false
      assert item.title == "some updated title"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Activities.update_item(item, @invalid_attrs)
      assert item == Activities.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Activities.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Activities.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Activities.change_item(item)
    end
  end
end
