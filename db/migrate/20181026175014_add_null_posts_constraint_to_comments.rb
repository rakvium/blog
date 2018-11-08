# frozen_string_literal: true

class AddNullPostsConstraintToComments < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :post_id, false
  end
end
