# frozen_string_literal: true

class ReplaceRolesWithTypeOnUsers < ActiveRecord::Migration[5.2]
  def up
    # It's fine to set not null column this way, since we don't have tons of records yet
    add_column :users, :type, :string, null: false, default: 'Author'

    execute <<-SQL
      UPDATE users
      SET type = CASE
                   WHEN roles.name = 'root' THEN 'Root'
                   WHEN roles.name = 'admin' THEN 'Admin'
                   ELSE 'Author'
                 END
      FROM roles
      INNER JOIN users_roles ON users_roles.role_id = roles.id
      WHERE users_roles.user_id = users.id AND users_roles.role_id = roles.id;
    SQL

    execute %( DROP TABLE users_roles; )
    execute %( DROP TABLE roles; )
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
