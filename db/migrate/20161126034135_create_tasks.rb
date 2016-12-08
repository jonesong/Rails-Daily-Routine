class CreateTasks < ActiveRecord::Migration[5.0]

  def up
    create_table :tasks do |t|
      t.integer "project_id"
      t.string "name", :limit => 30, :null => false
      t.string "note", :limit => 100, :null => true
      t.datetime "due_date"
      t.boolean "done", :default => false
      t.timestamps
    end
    add_index("tasks", "project_id")
    add_index("tasks", "name")
  end

  def down
    drop_table :tasks
  end
end
