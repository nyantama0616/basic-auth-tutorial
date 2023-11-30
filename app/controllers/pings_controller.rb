class PingsController < ApplicationController
  def index
    render json: {message: "ping"}
  end

  def test
    res = {
      db_host: ENV["DATABASE_HOST"],
      db_url: ENV["DATABASE_URL"],
      db_username: ENV["DATABASE_USERNAME"],
      db_password: ENV["DATABASE_PASSWORD"],
      db_config: ActiveRecord::Base.connection_db_config.to_json
    }

    render json: res
  end
end
