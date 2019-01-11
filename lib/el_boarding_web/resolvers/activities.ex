defmodule ElBoardingWeb.Resolvers.Activities do
  alias ElBoarding.Activities

  def topics(_, _, _) do
    {:ok, Activities.list_topics}
  end

  def topic_items(_,  %{topic_id: topic_id}, _) do
    {:ok, Activities.list_topic_items(topic_id)}
  end
end