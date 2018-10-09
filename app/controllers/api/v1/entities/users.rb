# frozen_string_literal: true

module API
  module V1
    module Entities
      class Users < Grape::Entity
        root :posts

        expose :id, documentation: {
          type: 'integer',
          desc: "post's id"
        }, &:id

        expose :email, documentation: {
          type: 'string',
          desc: "post's email"
        }, &:email

        expose :first_name, documentation: {
          type: 'string',
          desc: "post's first_name"
        }, &:first_name

        expose :last_name, documentation: {
          type: 'string',
          desc: "post's last_name"
        }, &:last_name
      end
    end
  end
end
