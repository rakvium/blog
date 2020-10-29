# frozen_string_literal: true

class BlogSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Pagination::Connections
  use GraphQL::Execution::Errors

  def self.unauthorized_object(_error)
    raise GraphQL::ExecutionError, I18n.t('authentication.failure.unauthenticated')
  end
end
