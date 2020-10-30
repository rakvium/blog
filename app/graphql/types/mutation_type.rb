# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::Users::SignUp
    field :login, mutation: Mutations::Users::Login
    field :sign_out, mutation: Mutations::Users::SignOut
  end
end
