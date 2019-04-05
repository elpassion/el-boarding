class Mutations::CreateUserAnswer < Mutations::BaseMutation
  argument :answers_ids, [Integer, null: true], required: true
  field :errors, String, null: false

  def resolve(answers_ids:)
    answers = Answer.find(answers_ids)
    answers_respond(answers)
    # TODO: Handle errors
    {
      errors: 'none' # to be removed
    }
  end

  private

  def answers_respond(answers)
    answers.each do |answer|
      user_answer = user.user_answers.find_or_initialize_by(answer: answer, response: true)
      user_answer.save
    end
  end

  def user
    @user ||= User.first
  end
end
