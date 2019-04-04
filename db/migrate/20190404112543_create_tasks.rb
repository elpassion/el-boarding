class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :name
      t.text :description
      t.references :epic, foreign_key: true

      t.timestamps
    end
  end
end
