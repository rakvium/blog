require 'spec_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#after_sign_out_path_for' do
    it 'returns referer' do
      controller.after_sign_out_path_for(nil).should equal(request.referer)
    end
  end
end
