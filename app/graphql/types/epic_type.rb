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

  def tasks
    user_tasks.map(&:task)
  end

  private

  def user_tasks
    @user_tasks ||= UserTask.where(user: user)
  end

  def user
    User.first
  end
end