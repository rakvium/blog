require 'spec_helper'

RSpec.describe UsersRole, type: :model do
  context 'relations' do
    it { should belong_to(:user) }
    it { should belong_to(:role) }
  end
end
