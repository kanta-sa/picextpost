# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( layouts/navbar.css )
Rails.application.config.assets.precompile += %w( toppages/toppage.css )
Rails.application.config.assets.precompile += %w( users/users_show.css )
Rails.application.config.assets.precompile += %w( users/users_new.css )
Rails.application.config.assets.precompile += %w( users/follow.css )
Rails.application.config.assets.precompile += %w( prefectures/prefectures.css )
Rails.application.config.assets.precompile += %w( sessions/sessions.css )
Rails.application.config.assets.precompile += %w( microposts/microposts.css )
