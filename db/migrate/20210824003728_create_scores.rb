class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.float :distance,      null: false
      t.integer :hour,        null: false
      t.integer :minute,      null: false
      t.integer :second,      null: false
      t.integer :area_id,     null: false
      t.date :date,           null: false
      t.boolean :private
      t.integer :challenge_id
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
