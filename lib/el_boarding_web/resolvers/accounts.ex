defmodule ElBoardingWeb.Resolvers.Accounts do
  alias ElBoarding.Accounts

  def user(_, %{user_id: user_id}, _) do
    {:ok, Accounts.get_user!(user_id)}
  end
end