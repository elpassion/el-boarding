class Question < ApplicationRecord
  validates :description, presence: true

  has_many :answers, dependent: :destroy
  belongs_to :epic
  accepts_nested_attributes_for :answers,
                                reject_if: :all_blank, allow_destroy: true
end
