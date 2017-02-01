# Grape API to receive posts and comments
class API < Grape::API
  format :json
  prefix :api

  get :posts do
    Post.all
  end
end
