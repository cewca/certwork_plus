# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
=begin
Rails.application.config.assets.precompile += %w( .svg .eot .woff .ttf )
Rails.application.config.assets.precompile += %w( bootstrap/fonts/glyphicons-halflings-regular.svg )
Rails.application.config.assets.precompile += %w( bootstrap/fonts/glyphicons-halflings-regular.eot )
Rails.application.config.assets.precompile += %w( bootstrap/fonts/glyphicons-halflings-regular.woff )
Rails.application.config.assets.precompile += %w( bootstrap/fonts/glyphicons-halflings-regular.ttf )
=end

Rails.application.config.assets.precompile << Proc.new { |path|
  if path =~ /\.(eot|svg|ttf|woff|otf)\z/
    true
  end
}

Rails.application.config.assets.precompile += %w( candidate_dashboard.js )
