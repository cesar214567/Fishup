class CreateBaits < ActiveRecord::Migration[6.1]
  def change
    create_table :baits do |t|
      t.string :cost
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
