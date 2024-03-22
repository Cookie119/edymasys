require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> f60aefb84e6a000dbe20e59d041d0ef76f9ddbe4
module Project
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))
<<<<<<< HEAD
=======
module RubyRailsPostgres
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
>>>>>>> 619fbaf1af67af1e60365c9f190a873b6d7a3d5b
=======
>>>>>>> f60aefb84e6a000dbe20e59d041d0ef76f9ddbe4

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
<<<<<<< HEAD
<<<<<<< HEAD
    config.action_dispatch.default_headers['X-Content-Type-Options'] = 'nosniff'

=======
>>>>>>> 619fbaf1af67af1e60365c9f190a873b6d7a3d5b
=======
    config.action_dispatch.default_headers['X-Content-Type-Options'] = 'nosniff'

>>>>>>> f60aefb84e6a000dbe20e59d041d0ef76f9ddbe4
  end
end
