# frozen_string_literal: true

module API
  module V1
    module Entities
      class Users < Grape::Entity
        root :users

        expose :id, documentation: {
          type: 'integer',
          desc: "post's id"
        }, as: :id

        expose :email, documentation: {
          type: 'string',
          desc: "post's email"
        }, as: :email

        expose :first_name, documentation: {
          type: 'string',
          desc: "post's first_name"
        }, as: :first_name

        expose :last_name, documentation: {
          type: 'string',
          desc: "post's last_name"
        }, as: :last_name
      end
    end
  end
end
