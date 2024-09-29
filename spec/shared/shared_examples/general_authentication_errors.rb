# frozen_string_literal: true

shared_examples 'general authentication errors' do |key|
  it 'has no data' do
    expect(execution_response.dig(:data, key)).to be_nil
  end

  it 'has proper general error' do
    expect(execution_response[:errors].try(:first).try(:[], :message)).to eq(
      I18n.t('authentication.failure.unauthenticated')
    )
  end
end
