module Types
  class MutationType < Types::BaseObject
    field :create_user_task, mutation: Mutations::CreateUserTask
  end
end
