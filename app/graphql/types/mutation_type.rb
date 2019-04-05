module Types
  class MutationType < Types::BaseObject
    field :create_user_task, mutation: Mutations::CreateUserTask
    field :create_user_answer, mutation: Mutations::CreateUserAnswer
  end
end
