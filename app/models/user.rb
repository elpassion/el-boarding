class User < ApplicationRecord
  validates :email,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  has_many :user_tasks
  has_many :tasks, through: :user_tasks
end
