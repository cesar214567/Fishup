class CreateCatches < ActiveRecord::Migration[6.1]
  def change
    create_table :catches do |t|
      t.string :name
      t.string :description
      t.string :habitat
      t.string :scientific_name
      t.float :minimum_size
      t.float :maximum_size

      t.timestamps
    end
  end
end
