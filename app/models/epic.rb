class Epic < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :epic_lists
end
