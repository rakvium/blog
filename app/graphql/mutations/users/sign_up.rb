# frozen_string_literal: true

module Mutations
  module Users
    class SignUp < Mutations::BaseMutation
      description 'Sign up for users'

      argument :email, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true
      argument :first_name, String, required: false
      argument :last_name, String, required: false

      field :user, Types::UserType, null: true
      field :token, String, null: true
      field :errors, Types::ValidationErrorsType, null: true

      def resolve(args = {})
        ActiveRecord::Base.transaction do
          user = User.new(args)

          if user.save
            {
              user: user,
              token: TokenManager::TokenCreator.call(user, context[:request])
            }
          else
            {
              errors: user.errors
            }
          end
        end
      end

      def self.authorized?(_object, context)
        return true if context[:current_user].blank?

        raise GraphQL::ExecutionError, I18n.t('authentication.failure.already_signed_up')
      end
    end
  end
end
