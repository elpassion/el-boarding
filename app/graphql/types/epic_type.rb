class Types::EpicType < Types::BaseObject
  field :id, Integer, null: false
  field :name, String, null: false
  field :tasks, [Types::TaskType], null: true, description: 'Tasks'
end