puts "from hello"
puts ActiveRecord::Base.connection_db_config.to_json
puts "env: #{Rails.env}"
