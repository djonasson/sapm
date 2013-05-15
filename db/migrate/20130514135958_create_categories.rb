class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :project
      t.string :name
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.integer :position, null: false, default: 0
      t.timestamps
    end
  end
end
