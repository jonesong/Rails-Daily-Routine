class CreateProjects < ActiveRecord::Migration[5.0]

  def up
    create_table :projects do |t|
      t.integer "user_id"
      t.string "name", :limit => 30, :null => false
      t.string "note", :limit => 100, :null => true
      t.timestamps
    end
    add_index("projects", "user_id")
    add_index("projects", "name")
  end

  def down
    drop_table :projects
  end
end
