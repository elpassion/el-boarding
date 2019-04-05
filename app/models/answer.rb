class Answer < ApplicationRecord
  validates :description, presence: true

  belongs_to :question
  has_many :users, through: :user_answers
end
