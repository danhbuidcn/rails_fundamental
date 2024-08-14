# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsFundamental
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.autoload_paths += %W(#{config.root}/lib)

    # config.time_zone sets the default time zone for the application.
    config.time_zone = 'Asia/Ho_Chi_Minh'
    # config.active_record.default_timezone sets the default time zone for Active Record.
    config.active_record.default_timezone = :utc
  end
end
