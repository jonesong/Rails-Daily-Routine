class CreatePrograms < ActiveRecord::Migration[5.0]

  def up
    create_table :programs do |t|
      t.string "name", :limit => 50, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :programs
  end
end
