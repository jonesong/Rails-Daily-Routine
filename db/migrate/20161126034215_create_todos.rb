class CreateTodos < ActiveRecord::Migration[5.0]

  def up
    create_table :todos do |t|
      t.integer "task_id"
      t.string "note", :limit => 100, :null => true
      t.datetime "date_started"
      t.datetime "time_total"
      t.datetime "time_start"
      t.datetime "time_end"
      t.timestamps
    end
    add_index("todos", "task_id")
  end

  def down
    drop_table :todos
  end
end
