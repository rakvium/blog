# frozen_string_literal: true

namespace :graphql do
  desc 'This task generates graphql-docs page'

  task generate_docs: :environment do
    file = Rails.root.join('schema.graphql')

    abort('Could not find schema.graphql file') unless file.exist?

    GraphQLDocs.build(
      filename: file.to_path,
      output_dir: './public/graphql-docs/',
      base_url: '/graphql-docs',
      delete_output: true
    )

    puts 'Docs were successfully created and put into public folder'
  end
end
