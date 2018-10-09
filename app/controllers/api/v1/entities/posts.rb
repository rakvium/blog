# frozen_string_literal: true

module API
  module V1
    module Entities
      class Posts < Grape::Entity
        root :posts

        expose :id, documentation: {
          type: 'integer',
          desc: "post's id"
        }, &:id

        expose :title, documentation: {
          type: 'string',
          desc: "post's title"
        }, &:title

        expose :text, documentation: {
          type: 'text',
          desc: "post's text"
        }, &:text

        expose :user, with: API::V1::Entities::Users
      end
    end
  end
end
