# frozen_string_literal: true

module Resolvers
  class Me < Resolvers::Base
    description 'Returns the current user'

    type Types::UserType, null: true

    def resolve
      context[:current_user]
    end

    def self.authorized?(object, context)
      super && context[:current_user].present?
    end
  end
end
