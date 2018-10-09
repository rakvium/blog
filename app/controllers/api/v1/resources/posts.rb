# frozen_string_literal: true

module API
  module V1
    module Resources
      class Posts < Grape::API
        include API::V1::Defaults

        namespace :posts do
          resource do
            desc 'Get all posts with it\'s related users'

            get do
              posts = Post.includes(:user)

              status 200
              present posts, with: API::V1::Entities::Posts
            end
          end
        end
      end
    end
  end
end
