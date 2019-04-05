class User < ApplicationRecord
  validates :email,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  has_many :user_answers
  has_many :user_tasks
  has_many :answers, through: :user_answers
  has_many :tasks, through: :user_tasks
end
