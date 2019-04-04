class Question < ApplicationRecord
  validates :description, presence: true

  has_many :answers
end
