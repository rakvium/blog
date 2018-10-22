# frozen_string_literal: true

require 'spec_helper'
require 'cancan/matchers'

describe Ability, type: :model do
  describe 'user abilities' do
    subject(:ability) { Ability.new(user) }

    let(:user) { nil }

    it { is_expected.to be_able_to(:read, :all) }

    context 'when is a registered user' do
      let(:user) { FactoryBot.create(:user) }

      it { is_expected.to be_able_to(:crud, Post.new(user_id: user.id)) }
      it { is_expected.to be_able_to(:crud, Comment.new(user_id: user.id)) }
    end

    context 'when is an admin' do
      let(:user) { FactoryBot.create(:user, :admin) }

      it { is_expected.to be_able_to(:manage, :all) }
    end

    context 'when is a root' do
      let(:user) { FactoryBot.create(:user, :root) }

      it { is_expected.to be_able_to(:manage, :all) }
    end
  end
end
