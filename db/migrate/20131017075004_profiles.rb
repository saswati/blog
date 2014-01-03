class Profiles < ActiveRecord::Migration
  def up
    add_column :profiles, :name, :string
  end

  def down
    remove_column :profiles, :name
  end
end
