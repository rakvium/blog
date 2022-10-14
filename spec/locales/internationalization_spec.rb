# frozen_string_literal: true

require 'spec_helper'

I18n.available_locales.each do |locale_name|
  context "#{locale_name} locale" do
    describe 'locale file' do
      locale_file = "config/locales/#{locale_name}.yml"

      it_behaves_like 'a valid locale file', locale_file

      it { expect(locale_file).to be_a_subset_of 'config/locales/en.yml' }
    end
  end
end
