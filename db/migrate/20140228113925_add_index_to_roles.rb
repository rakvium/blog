class AddIndexToRoles < ActiveRecord::Migration
  def up
    add_index :roles, :name, :unique => true
  end

    def down
    remove_index :roles, :name
  end
end
