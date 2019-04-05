class AddCorrectFieldConstrainsForAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :correct, :boolean, null: false, default: false
  end
end
