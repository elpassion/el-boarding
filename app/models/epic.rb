class Epic < ApplicationRecord
  validates :name, presence: true

  has_many :epic_lists_epics
  has_many :epic_lists, through: :epic_lists_epics
  has_many :tasks
end
