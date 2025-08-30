require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
  # or in config/master.key.
  # config.require_master_key = true

  # Serve static files (CSS, JS, imágenes) en Render.
  config.public_file_server.enabled = true

  # Compress CSS using a preprocessor.
  # config.assets.css_compressor = :sass

  # En Render sí conviene que compile los assets si falta algo.
  config.assets.compile = true

  # Hosts permitidos (Render asigna un dominio *.onrender.com).
  config.hosts << 'saludtech-todo-app.onrender.com'
  config.hosts << /.*\.onrender\.com/

  # Store uploaded files on the local file system.
  config.active_storage.service = :local

  # Force all access to the app over SSL.
  config.force_ssl = true

  config.log_level = :info
  config.log_tags = [:request_id]

  config.action_mailer.perform_caching = false

  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
