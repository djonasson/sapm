class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.text :description
      t.text :background
      t.references :category
      t.integer :position, null: false, default: 0
      t.timestamps
    end
  end
end
