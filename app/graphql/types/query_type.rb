# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :me, resolver: Resolvers::Me
  end
end
