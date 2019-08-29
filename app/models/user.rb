class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  has_many :user_answers
  has_many :user_tasks
  has_many :answers, through: :user_answers
  has_many :tasks, through: :user_tasks
end
