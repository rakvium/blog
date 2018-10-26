# frozen_string_literal: true

RSpec.shared_examples 'user' do
  subject { user.public_send("#{described_class.to_s.downcase}?") }

  let!(:user) { create(described_class.to_s.downcase.to_sym) }

  it "has #{described_class} type" do
    is_expected.to be_truthy
  end

  it "is object of #{described_class} class" do
    expect(user).to be_an_instance_of(described_class)
  end
end
