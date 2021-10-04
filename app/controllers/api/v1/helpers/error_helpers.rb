# frozen_string_literal: true

module API
  module V1
    module Helpers
      module ErrorHelpers
        extend Grape::API::Helpers

        def render_error(error, status, code)
          errors_object([{ status: status, description: error.message }], code)
        end

        def render_not_found
          errors_object(
            [{ status: :not_found, description: "Endpoint for '#{request.path}' or operation not found" }], 404
          )
        end

        def server_error(error)
          log_unhandled_error(error)
          errors_object([{ status: :server_error, description: 'Internal Server Error.' }], 500)
        end

        def log_unhandled_error(error)
          logger.error 'Exception'
          logger.error "  URI: #{env['REQUEST_URI']}"
          logger.error "  Exception: #{error.class}, message: #{error.message}"
          logger.error '  Backtrace:'
          error.backtrace.each { |line| logger.error("  #{line}") }
        end

        def errors_object(error_array, code)
          error!({ errors: error_array }, code)
        end
      end
    end
  end
end
