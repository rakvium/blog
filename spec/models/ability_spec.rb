# frozen_string_literal: true

require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  subject { described_class.new(user) }

  context 'when is a guest' do
    let(:user) { create(:guest) }

    it { is_expected.to be_able_to(:read, :all) }
  end

  context 'when is a author' do
    let(:user) { create(:author) }

    it { is_expected.to be_able_to(:crud, Post.new(user_id: user.id)) }
    it { is_expected.to be_able_to(:create, Comment.new(user_id: user.id)) }
    it { is_expected.to be_able_to(:destroy, Comment.new(user_id: user.id)) }
  end

  context 'when is an admin' do
    let(:user) { create(:admin) }

    it { is_expected.to be_able_to(:manage, :all) }
  end

  context 'when is a root' do
    let(:user) { create(:root) }

    it { is_expected.to be_able_to(:manage, :all) }
  end
end
