# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'LoginMutation' do
  let(:execution_response) { execute_schema_query! }
  let(:request) { ActionDispatch::TestRequest.create }

  before do
    prepare_query_variables({})
    prepare_context({ request: request })
    prepare_query("
      mutation login($email: String!, $password: String!){
        login(email: $email, password: $password) {
          user {
            id
            email
          }
          token
        }
      }
    ")
  end

  context 'when there\'s no current user' do
    context 'when user doesn\'t exist' do
      let(:password) { SecureRandom.uuid }

      before do
        prepare_query_variables(
          {
            email: Faker::Internet.email,
            password: password
          }
        )
      end

      it 'has no data' do
        expect(execution_response.dig(:data, :login)).to eq(nil)
      end

      it 'has proper general error' do
        expect(execution_response[:errors].try(:first).try(:[], :message)).to eq(
          I18n.t('authentication.failure.not_found_in_database')
        )
      end
    end

    context 'when there\'s a matching user' do
      let(:user) { create(:user) }
      let(:random_token) { SecureRandom.hex }
      let(:service_instance) { instance_double(TokenManager::TokenCreator) }

      before do
        prepare_query_variables(
          {
            email: user.email,
            password: user.password
          }
        )
      end

      it 'shows the user\'s email' do
        expect(execution_response.dig(:data, :login, :user, :email)).to eq(user.email)
      end

      it 'shows the user\'s token' do
        allow(TokenManager::TokenCreator).to receive(:new).and_return(service_instance)
        allow(service_instance).to receive(:call).and_return(random_token)

        expect(execution_response.dig(:data, :login, :token)).to eq(random_token)
      end

      context 'when password is wrong' do
        let(:wrong_password) { Faker::Lorem.characters(number: 8) }

        before do
          prepare_query_variables(
            {
              email: user.email,
              password: wrong_password
            }
          )
        end

        it 'has no data' do
          expect(execution_response.dig(:data, :login)).to eq(nil)
        end

        it 'has proper general error' do
          expect(execution_response[:errors].try(:first).try(:[], :message)).to eq(
            I18n.t('authentication.failure.invalid')
          )
        end
      end
    end
  end

  context 'when there\'s a current user' do
    let(:user) { create(:user) }

    before do
      prepare_context({ current_user: user })
      prepare_query_variables(
        {
          email: user.email,
          password: user.password
        }
      )
    end

    it 'has no data' do
      expect(execution_response.dig(:data, :login)).to eq(nil)
    end

    it 'has proper general error' do
      expect(execution_response[:errors].try(:first).try(:[], :message)).to eq(
        I18n.t('authentication.failure.already_signed_in')
      )
    end
  end
end
