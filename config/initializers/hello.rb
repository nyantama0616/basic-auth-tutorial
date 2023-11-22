puts "from hello"
puts ActiveRecord::Base.connection_db_config.to_json
puts "env: #{Rails.env}"
puts Rails.application.config.hosts
puts "secret: #{Rails.application.credentials.secret_key_base}"
puts "env-secret: #{ENV['SECRET_KEY_BASE']}"
