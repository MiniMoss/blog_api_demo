# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( metronic/global/global_js/respond.min.js )
Rails.application.config.assets.precompile += %w( metronic/global/global_js/excanvas.min.js )

Rails.application.config.assets.precompile += %w( metronic/global.css )
Rails.application.config.assets.precompile += %w( metronic/global.js )

Rails.application.config.assets.precompile += %w( metronic/login.css )
Rails.application.config.assets.precompile += %w( metronic/login.js )

Rails.application.config.assets.precompile += %w( metronic/theme.css )
Rails.application.config.assets.precompile += %w( metronic/theme.js )

Rails.application.config.assets.precompile += %w( metronic/users.css )
Rails.application.config.assets.precompile += %w( metronic/users.js )

Rails.application.config.assets.precompile += %w( metronic/devise_registrations_edit.css )
Rails.application.config.assets.precompile += %w( metronic/devise_registrations_edit.js )
