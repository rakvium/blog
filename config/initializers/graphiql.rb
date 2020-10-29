# frozen_string_literal: true

if Rails.env.development?
  GraphiQL::Rails.config.csrf = false
  GraphiQL::Rails.config.headers['X_AUTH_TOKEN'] = ->(_context) { ENV['GRAPHIQL_AUTH_TOKEN'] }
end
