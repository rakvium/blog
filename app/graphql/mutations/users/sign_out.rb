# frozen_string_literal: true

module Mutations
  module Users
    class SignOut < Mutations::BaseMutation
      description 'Sign out for users'

      field :user, Types::UserType, null: false

      def resolve
        auth_token = context[:auth_token].destroy

        if auth_token.destroyed?
          {
            user: context[:current_user]
          }
        else
          GraphQL::ExecutionError.new(I18n.t('authentication.sessions.broken_sign_out'))
        end
      end

      def self.authorized?(object, context)
        super && context[:current_user].present?
      end
    end
  end
end
