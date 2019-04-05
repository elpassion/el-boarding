class Types::AnswerType < Types::BaseObject
  field :id, Integer, null: false
  field :description, String, null: false
  field :correct, Boolean, null: false # To be removed
  field :response, Boolean, null: true # To be removed

  def response
    user_answer&.response
  end

  private

  def user_answer
    @user_answer ||= UserAnswer.find_by(user: user, answer: object)
  end

  def user
    User.first
  end
end