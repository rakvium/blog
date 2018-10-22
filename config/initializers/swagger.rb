# frozen_string_literal: true

GrapeSwaggerRails.options.url = '/swagger_doc.json'
GrapeSwaggerRails.options.doc_expansion = 'list'

GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end
