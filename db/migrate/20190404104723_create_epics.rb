class CreateEpics < ActiveRecord::Migration[5.2]
  def change
    create_table :epics do |t|
      t.string :name
      t.references :epic_list, foreign_key: true

      t.timestamps
    end
  end
end
