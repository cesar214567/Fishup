class CreateVotedSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :voted_spots do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :is_favourite

      t.timestamps
    end
  end
end
