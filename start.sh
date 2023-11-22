#!/bin/sh
RAILS_PORT=3000
if [ -n "$PORT" ]; then
  RAILS_PORT=$PORT
fi

# migration
bin/rails db:migrate RAILS_ENV=development

# assets precompile
bundle exec rake assets:precompile RAILS_ENV=development

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

bin/rails s -p $RAILS_PORT -b 0.0.0.0
