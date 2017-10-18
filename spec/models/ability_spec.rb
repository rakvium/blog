require 'spec_helper'
require 'cancan/matchers'

describe Ability, type: :model do
  describe 'user abilities' do
    subject(:ability) { Ability.new(user) }
    let(:user) { nil }

    it { should be_able_to(:read, :all) }

    context 'when is a registered user' do
      let(:user) { FactoryGirl.create(:user) }

      it { should be_able_to(:crud, Post.new(user_id: user.id)) }
      it { should be_able_to(:crud, Comment.new(user_id: user.id)) }
    end

    context 'when is an admin' do
      let(:user) { FactoryGirl.create(:user, :admin) }

      it { should be_able_to(:manage, :all) }
    end

    context 'when is a root' do
      let(:user) { FactoryGirl.create(:user, :root) }

      it { should be_able_to(:manage, :all) }
    end
  end
end
