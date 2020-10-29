# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # TODO: Remove after defining real queries
    field :test, String, null: false

    def test
      'test query'
    end
  end
end
