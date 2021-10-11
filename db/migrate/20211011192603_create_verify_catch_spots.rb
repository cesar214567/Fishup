class CreateVerifyCatchSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :verify_catch_spots do |t|
      t.references :catch_spot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
