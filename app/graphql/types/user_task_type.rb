class Types::UserTaskType < Types::BaseObject
  field :user_id, Integer, null: false
  field :task_id, Integer, null: false
end
