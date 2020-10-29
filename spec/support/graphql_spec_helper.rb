# frozen_string_literal: true

module GraphqlSpecHelper
  def execute_schema_query!
    BlogSchema.execute(
      @query,
      context: @context,
      variables: @variables
    ).to_h.deep_symbolize_keys!
  end

  def prepare_query_variables(variables)
    @variables = variables
  end

  def prepare_context(context)
    @context = context
  end

  def prepare_query(query)
    @query = query
  end
end
