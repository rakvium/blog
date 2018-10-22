# frozen_string_literal: true

class CreateUsersRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :users_roles do |t|
      t.references :user, index: true
      t.references :role, index: true

      t.timestamps
    end
  end
end
