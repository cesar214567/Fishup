class CreateBaitCatches < ActiveRecord::Migration[6.1]
  def change
    create_table :bait_catches do |t|
      t.references :catch, null: false, foreign_key: true
      t.references :bait, null: false, foreign_key: true

      t.timestamps
    end
  end
end
