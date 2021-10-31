# frozen_string_literal: true

require 'spec_helper'

describe FactoryBot do
  it { described_class.lint(traits: true) }
end
