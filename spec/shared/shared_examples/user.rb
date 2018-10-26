# frozen_string_literal: true

RSpec.shared_examples 'user' do
  let(:user) { create(described_class.to_s.downcase.to_sym) }

  it "has #{described_class} type" do
    expect(user.type).to eq described_class.to_s
  end

  it "is object of #{described_class} class" do
    expect(user).to be_an_instance_of(described_class)
  end
end
