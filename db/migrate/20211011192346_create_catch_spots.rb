class CreateCatchSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :catch_spots do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :catch, null: false, foreign_key: true
      t.string :rarity

      t.timestamps
    end
  end
end
