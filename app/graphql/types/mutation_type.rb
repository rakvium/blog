# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: Remove after defining real queries
    field :test_field, String, null: false

    def test_field
      'test mutation'
    end
  end
end
