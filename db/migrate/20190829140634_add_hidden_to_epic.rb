class AddHiddenToEpic < ActiveRecord::Migration[5.2]
  def change
    add_column :epics, :hidden, :boolean, default: false
  end
end
