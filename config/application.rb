# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    config.load_defaults 5.2

    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    config.assets.precompile += ['fontawesome-webfont.ttf',
                                 'fontawesome-webfont.eot',
                                 'fontawesome-webfont.svg',
                                 'fontawesome-webfont.woff']
    config.assets.paths << Rails.root.join('app/assets/fonts')
    config.generators do |g|
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.test_framework :rspec, fixtures: true,
                               view_specs: false,
                               helper_specs: false,
                               routing_specs: false,
                               controller_specs: true,
                               request_specs: false
    end
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app/api/*')]
  end
end
