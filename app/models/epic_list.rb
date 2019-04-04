class EpicList < ApplicationRecord
  validates :name, presence: true

  has_many :epic_lists_epics
  has_many :epics, through: :epic_lists_epics
end
