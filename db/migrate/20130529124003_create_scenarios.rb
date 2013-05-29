class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.string :name
      t.text :description
      t.integer :position, null: false, default: 0
      t.references :feature
      t.timestamps
    end
  end
end
