class RemoveReferenceFromEpics < ActiveRecord::Migration[5.2]
  def change
    remove_reference :epics, :epic_list, index: true, foreign_key: true
  end
end
