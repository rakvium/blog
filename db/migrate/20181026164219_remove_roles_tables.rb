# frozen_string_literal: true

class RemoveRolesTables < ActiveRecord::Migration[5.2]
  def up
    execute %( DROP TABLE IF EXISTS users_roles; )
    execute %( DROP TABLE IF EXISTS roles; )
  end
end
