# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'MeQuery' do
  let(:execution_response) { execute_schema_query! }

  before do
    prepare_query_variables({})
    prepare_context({})
    prepare_query('{
      me {
        id
        email
        firstName
        lastName
        type
      }
    }')
  end

  context 'when there\'s no current user' do
    it_behaves_like 'general authentication errors', :me
  end

  context 'when there\'s a current user' do
    let(:user) { create(:user) }

    before do
      prepare_context({ current_user: user })
    end

    it 'shows the user\'s email' do
      expect(execution_response.dig(:data, :me, :email)).to eq(user.email)
    end
  end
end
