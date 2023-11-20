include ActionController::HttpAuthentication::Basic::ControllerMethods #authenticate_or_request_with_http_basicメソッドがこのモジュールに含まれてるから、includeする

class UsersController < ApplicationController
    before_action :basic_auth, only: [:show, :update, :destroy] #show, update, destroyアクション実行時のみ、Basic認証を要求する

    def index
        users = User.all
        render json: {users: users}
    end
    
    def show
        render json: @current_user.as_json(only: [:user_id, :password])
    end

    def create
        user = User.new(user_id: params["user_id"], password: params["password"])
        if user.save
            render json: user.as_json(only: [:user_id, :password])
        else
            errors = user.errors.full_messages
            render json: {message: "Failed...", errors: errors} #ユーザ作成に失敗した場合は、エラーメッセージを返す
        end
    end

    def update
        @current_user.update(nickname: params["nickname"], comment: params["comment"])
        render json: @current_user.as_json(only: [:nickname, :comment])
    end

    def destroy
        @current_user.destroy
        users = User.all
        render json: {users: users} #ちゃんとユーザが削除されたか確認するため、ユーザ一覧を返している
    end

    private

    def basic_auth
        authenticate_or_request_with_http_basic do |user_id, password|
            @current_user = User.find_by(user_id: user_id, password: password) #インスタンス変数に代入することで、users_controller内のどこからでも、@current_userを参照できる
            !!@current_user #true or false
        end
    end
end
