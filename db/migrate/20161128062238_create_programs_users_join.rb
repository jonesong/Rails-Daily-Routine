class CreateProgramsUsersJoin < ActiveRecord::Migration[5.0]
  def up
    create_table :programs_users, :id => false do |t|
      t.integer "program_id"
      t.integer "user_id"
    end
    add_index("programs_users", ["program_id", "user_id"])
  end

  def down
    drop_table :programs_users
  end
end
