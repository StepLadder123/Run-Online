class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :distance,    null: false
      t.time :time,           null: false
      t.integer :area_id,     null: false
      t.date :date,           null: false
      t.boolean :private
      t.integer :challenge_id
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
