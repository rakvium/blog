# frozen_string_literal: true

module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix 'api'
        version 'v1', using: :path
        default_format :json
        format :json

        helpers do
          def permitted_params
            @permitted_params ||= declared(params, include_missing: false)
          end

          def logger
            Rails.logger
          end
        end

        rescue_from(Grape::Exceptions::ValidationErrors) { |e| render_error(e, :invalid_param, 400) }
        rescue_from(ActiveRecord::RecordNotFound) { |e| render_error(e, :record_not_found, 404) }
        rescue_from(ActiveRecord::RecordInvalid) { |e| render_error(e, :invalid_param, 422) }
        rescue_from(:all) { |e| server_error(e) }
      end
    end
  end
end
