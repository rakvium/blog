# frozen_string_literal: true

module Mutations
  module Users
    class Login < Mutations::BaseMutation
      description 'Login for users'

      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::UserType, null: false
      field :token, String, null: false

      def resolve(args = {})
        user = User.find_for_authentication(email: args[:email])

        if user.present?
          if user.valid_password?(args[:password])
            {
              user:,
              token: TokenManager::TokenCreator.call(user, context[:request])
            }
          else
            GraphQL::ExecutionError.new(I18n.t('authentication.failure.invalid'))
          end
        else
          GraphQL::ExecutionError.new(I18n.t('authentication.failure.not_found_in_database'))
        end
      end

      def self.authorized?(_object, context)
        return true if context[:current_user].blank?

        raise GraphQL::ExecutionError, I18n.t('authentication.failure.already_signed_in')
      end
    end
  end
end
