class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :projects_users do |t|
      t.references :project
      t.references :user
    end
  end
end
