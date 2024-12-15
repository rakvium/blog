# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PostsHelper, type: :helper do
  let(:user) { build(:user) }
  let(:date) { DateTime.parse('2017-10-18T19:32:10+00:00').utc }

  describe '#full_name' do
    it 'returns string with a space between first name and last name' do
      helper.full_name(user).should == "#{user.first_name} #{user.last_name}"
    end
  end

  describe '#my_date_format' do
    it 'returns date in a readable format' do
      helper.my_date_format(date).should == '2017-10-18 | 19:32'
    end
  end
end
