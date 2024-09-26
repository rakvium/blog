# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    config.load_defaults 6.1

    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    config.assets.paths << Rails.root.join('app/assets/fonts')

    config.generators do |g|
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.test_framework :rspec, fixtures: true,
                               view_specs: false,
                               helper_specs: false,
                               routing_specs: false,
                               controller_specs: true,
                               request_specs: false
    end

    config.i18n.default_locale = :en
    config.i18n.available_locales = %i[
      de
      en
      es
      fr
      lt
      uk
    ]
  end
end
