class ReplacePostTextStringByText < ActiveRecord::Migration
  def up
    remove_column :posts, :text
    add_column    :posts, :text, :text
  end

  def down
    remove_column :posts, :text
    add_column    :posts, :text, :string
  end
end