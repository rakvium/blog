# frozen_string_literal: true

class ChangePostsConstraints < ActiveRecord::Migration[6.0]
  # rubocop:disable Metrics/MethodLength
  def change
    change_column_null(:posts, :title, false)
    add_foreign_key :posts, :users, on_delete: :cascade

    reversible do |dir|
      dir.up do
        execute <<-SQL.squish
          ALTER TABLE posts
            ADD CONSTRAINT check_posts_title_length
              CHECK (char_length(TRIM(title)) BETWEEN 1 AND 255);
        SQL
      end

      dir.down do
        execute <<-SQL.squish
          ALTER TABLE posts
            DROP CONSTRAINT check_posts_title_length;
        SQL
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
end
