include ActionController::HttpAuthentication::Basic::ControllerMethods #authenticate_or_request_with_http_basicメソッドがこのモジュールに含まれてるから、includeする

class UsersController < ApplicationController
    before_action :basic_auth, only: [:show] #showアクション実行時のみ、Basic認証を要求する
    
    def show
        # Basic認証ではブラウザに認証情報を保存する。
        # 認証が必要な処理の場合は、リクエスト時に認証情報をサーバに送り、都度その認証情報が正しいか検証する。
        # 下記では便宜上、認証情報をレスポンスに含んでいるが、本来は認証情報を送り返すなんてことはしないはず。てかやっちゃダメ。
        auth = request.headers["Authorization"] #これが認証情報！
        render json: {user: @current_user, auth: auth}
    end

    def create
        user = User.new(user_id: params["user_id"], password: params["password"])
        if user.save
            render json: {message: "Success to signup!", user: user} #ユーザ作成に成功した場合は、作成されたユーザの情報を返す
        else
            errors = user.errors.full_messages
            render json: {message: "Failed...", errors: errors} #ユーザ作成に失敗した場合は、エラーメッセージを返す
        end
    end

    private

    def basic_auth
        authenticate_or_request_with_http_basic do |user_id, password|
            @current_user = User.find_by(user_id: user_id, password: password) #インスタンス変数に代入することで、users_controller内のどこからでも、@current_userを参照できる
            !!@current_user #true or false
        end
    end
end