# frozen_string_literal: true

module API
  module V1
    module Resources
      class Ping < Base
        namespace :ping do
          desc 'Check API state'

          get do
            { result: 'pong' }
          end
        end
      end
    end
  end
end
