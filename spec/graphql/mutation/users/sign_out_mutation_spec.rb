# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'SignOutMutation' do
  let(:execution_response) { execute_schema_query! }

  before do
    prepare_query_variables({})
    prepare_context({})
    prepare_query("
      mutation signOut{
        signOut {
          user {
            id
            email
          }
        }
      }
    ")
  end

  context 'when there\'s no current user' do
    it_behaves_like 'general authentication errors', :signOut
  end

  context 'when there\'s a current user' do
    let(:authentication_token) { create(:authentication_token) }
    let(:user) { authentication_token.user }

    before do
      prepare_context(
        {
          current_user: user,
          auth_token: authentication_token
        }
      )
    end

    it 'shows the user\'s email' do
      expect(execution_response.dig(:data, :signOut, :user, :email)).to eq(user.email)
    end

    it 'removes user\'s auth token' do
      execute_schema_query!
      expect(authentication_token).to be_destroyed
    end

    context 'when token couldn\'t be destroyed' do
      before do
        allow(authentication_token).to receive(:destroyed?).and_return(false)
      end

      it 'has no data' do
        expect(execution_response.dig(:data, :signOut)).to eq(nil)
      end

      it 'has proper general error' do
        expect(execution_response[:errors].try(:first).try(:[], :message)).to eq(
          I18n.t('authentication.sessions.broken_sign_out')
        )
      end
    end
  end
end
