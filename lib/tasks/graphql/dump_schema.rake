# frozen_string_literal: true

namespace :graphql do
  desc 'This task dumps schema idl file'

  task dump_schema: :environment do
    require 'graphql/rake_task'

    GraphQL::RakeTask.new(
      load_schema: lambda { |_task|
        require File.expand_path('../../../app/graphql/blog_schema', __dir__)

        BlogSchema
      }
    )

    Rake::Task['graphql:schema:idl'].invoke
  end
end
