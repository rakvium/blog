# frozen_string_literal: true

class AddForeignKeysToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :users, on_delete: :nullify
    add_foreign_key :comments, :posts, on_delete: :cascade
  end
end
