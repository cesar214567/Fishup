class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.float :longitude
      t.float :latitude
      t.string :name
      t.string :description
      t.string :loc
      t.timestamps
    end
  end
end
