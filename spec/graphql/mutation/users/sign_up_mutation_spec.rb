# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'SignUpMutation', type: :request do
  let(:user) { build(:user) }
  let(:execution_response) { execute_schema_query! }
  let(:request) { ActionDispatch::TestRequest.create }

  before do
    prepare_query_variables(
      {
        email: user.email,
        password: user.password,
        passwordConfirmation: user.password
      }
    )
    prepare_context({ request: })
    prepare_query(<<~GQL)
      mutation signUp(
        $email: String!,
        $password: String!,
        $passwordConfirmation: String!,
        $firstName: String,
        $lastName: String
      ) {
        signUp(
          email: $email,
          password: $password,
          passwordConfirmation: $passwordConfirmation,
          firstName: $firstName,
          lastName: $lastName
        ) {
          user {
            id
            email
            firstName
            lastName
            type
          }
          token
          errors {
            details
            fullMessages
          }
        }
      }
    GQL
  end

  context 'when there\'s no current user' do
    context 'when user is valid' do
      let(:random_token) { SecureRandom.hex }
      let(:service_instance) { instance_double(TokenManager::TokenCreator) }

      it 'shows the user\'s email' do
        expect(execution_response.dig(:data, :signUp, :user, :email)).to eq(user.email)
      end

      it 'shows the user\'s token' do
        allow(TokenManager::TokenCreator).to receive(:new).and_return(service_instance)
        allow(service_instance).to receive(:call).and_return(random_token)

        expect(execution_response.dig(:data, :signUp, :token)).to eq(random_token)
      end

      it 'has no errors' do
        expect(execution_response.dig(:data, :signUp, :errors)).to be_nil
      end
    end

    context 'when user is invalid' do
      let(:user) { create(:user) }
      let(:invalid_user) { build(:user, email: user.email) }

      before do
        prepare_query_variables(
          {
            email: invalid_user.email,
            password: invalid_user.password,
            passwordConfirmation: invalid_user.password
          }
        )

        invalid_user.validate
      end

      it 'has no user' do
        expect(execution_response.dig(:data, :signUp, :user)).to be_nil
      end

      it 'has no token' do
        expect(execution_response.dig(:data, :signUp, :token)).to be_nil
      end

      it 'has proper errors' do
        expect(execution_response.dig(:data, :signUp, :errors, :fullMessages)).to eq(
          invalid_user.errors.full_messages
        )
      end
    end
  end

  context 'when there\'s a current user' do
    let(:user) { create(:user) }

    before do
      prepare_context({ current_user: user })
    end

    it 'has no data' do
      expect(execution_response.dig(:data, :signUp)).to be_nil
    end

    it 'has proper general error' do
      expect(execution_response[:errors].try(:first).try(:[], :message)).to eq(
        I18n.t('authentication.failure.already_signed_up')
      )
    end
  end
end
