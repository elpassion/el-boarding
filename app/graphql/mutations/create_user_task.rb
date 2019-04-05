class Mutations::CreateUserTask < Mutations::BaseMutation
  argument :task_id, Integer, required: true

  field :user_task, Types::UserTaskType, null: false
  field :errors, [String], null: false

  def resolve(task_id:)
    user = User.first
    task = Task.find(task_id)

    user_task = user.user_tasks.find_or_initialize_by(task: task)
    user_task.done = true
    if user_task.save
      {
        user_task: user_task,
        errors: [],
      }
    else
      {
        user_task: nil,
        errors: user_task.errors.full_messages
      }
    end
  end
end
