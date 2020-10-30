# frozen_string_literal: true

class BlogSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Pagination::Connections
  use GraphQL::Execution::Errors

  rescue_from(ActiveRecord::RecordNotSaved) do |err|
    raise GraphQL::ExecutionError, err.message
  end

  def self.unauthorized_object(_error)
    raise GraphQL::ExecutionError, I18n.t('authentication.failure.unauthenticated')
  end
end
