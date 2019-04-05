class Types::TaskType < Types::BaseObject
  field :id, Integer, null: false
  field :name, String, null: true
  field :description, String, null: true
  field :done, Boolean, null: true

  def done
    user_task&.done
  end

  private

  def user_task
    @user_task ||= UserTask.find_by(user: user, task: object)
  end

  def user
    User.first
  end
end