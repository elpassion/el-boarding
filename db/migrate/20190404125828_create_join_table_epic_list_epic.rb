class CreateJoinTableEpicListEpic < ActiveRecord::Migration[5.2]
  def change
    create_join_table :epic_lists, :epics do |t|
      t.index [:epic_list_id, :epic_id]
      t.index [:epic_id, :epic_list_id]
    end
  end
end
