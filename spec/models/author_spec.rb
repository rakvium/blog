# frozen_string_literal: true

require 'spec_helper'

describe Author, type: :model do
  it_behaves_like 'user'
end
