# frozen_string_literal: true

module API
  module V1
    H = API::V1::Helpers

    class Base < Grape::API
      helpers H::SharedHelpers, H::ErrorHelpers

      mount Resources::Posts
      mount Resources::Ping

      add_swagger_documentation(
        info: { title: 'Blog API' },
        tags: [
          { name: 'ping', description: false }
        ]
      )
    end
  end
end
