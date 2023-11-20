require 'rails_helper'

RSpec.describe "Pings", type: :request do
  describe "GET /pong" do
    it "レスポンスの値は意図したものか" do
      expected_body = {
        "message" => "ping"
      }

      get "/pong"

      # binding.pry #止めたいところでプログラムを止めて、変数の中身などを確認してみよう(pry-debug gemのおかげ)
      
      result_body = response.parsed_body
      expect(result_body).to eq(expected_body)
    end
  end
end
