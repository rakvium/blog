require 'spec_helper'

RSpec.describe PostsHelper, type: :helper do
  describe '#full_name' do
    it 'returns string with a space between first name and last name' do
      @user = FactoryGirl.build(:user)
      helper.full_name(@user).should == "#{@user.first_name} #{@user.last_name}"
    end
  end

  describe '#my_date_format' do
    it 'returns date in a readable format' do
      @date = DateTime.parse('2017-10-18T19:32:10+00:00').utc
      helper.my_date_format(@date).should == '18 October 2017 at 19:32'
    end
  end
end
