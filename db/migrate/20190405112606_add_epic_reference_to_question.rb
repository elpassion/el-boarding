class AddEpicReferenceToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :epic, foreign_key: true
  end
end
