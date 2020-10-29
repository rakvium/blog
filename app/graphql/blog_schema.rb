# frozen_string_literal: true

class BlogSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Pagination::Connections
  use GraphQL::Execution::Errors
end
