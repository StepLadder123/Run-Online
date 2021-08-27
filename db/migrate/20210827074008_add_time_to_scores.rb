class AddTimeToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :time, :integer, null: false
    add_column :scores, :lap,  :integer, null: false
  end
end
