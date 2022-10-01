# frozen_string_literal: true

if Rails.env.development?
  GraphiQL::Rails.config.csrf = false
  GraphiQL::Rails.config.header_editor_enabled = true
end
