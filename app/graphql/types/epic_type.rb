class Types::EpicType < Types::BaseObject
  field :id, Integer, null: false
  field :name, String, null: false
  field :tasks, [Types::TaskType], null: true, description: 'Tasks'
  field :task, Types::TaskType, null: false do
    description 'Tasks'
    argument :id, ID, required: true
  end

  def task(id:)
    Task.find(id)
  end
end