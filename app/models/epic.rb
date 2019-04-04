class Epic < ApplicationRecord
  validates :name, presence: true

  belongs_to :epic_list
end
