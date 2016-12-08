class CreateUsers < ActiveRecord::Migration[5.0]

  def up
    create_table :users do |t|
      t.string "username", :limit => 30, :null => false
      t.string "password", :limit => 40, :null => false
      t.string "first_name", :limit => 30, :null => false
      t.string "last_name", :limit => 30, :null => false
      t.timestamps
      # t.datetime "created_at"
      # t.datetime "updated_at"
    end
    add_index("users", "username")
  end

  def down
    drop_table :users
  end
end
