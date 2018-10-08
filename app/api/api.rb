# frozen_string_literal: true

# Grape API to receive posts and comments
class API < Grape::API
  format :json
  prefix :api
  version 'v1'

  get :posts do
    Post.all
  end
end
