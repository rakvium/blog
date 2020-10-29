# frozen_string_literal: true

class CreateAuthenticationTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :authentication_tokens do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :value_digest, null: false, index: { unique: true }
      t.string :ip_address, null: false, default: ''
      t.string :user_agent, null: false, default: ''
      t.datetime :last_used_at, null: false, index: true, default: -> { "(now() at time zone 'utc')" }
      t.datetime :created_at, null: false, default: -> { "(now() at time zone 'utc')" }
    end
  end
end
