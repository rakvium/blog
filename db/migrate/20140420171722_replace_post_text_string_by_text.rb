# frozen_string_literal: true

class ReplacePostTextStringByText < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :text, :text
  end

  def down
    change_column :posts, :text, :string
  end
end
