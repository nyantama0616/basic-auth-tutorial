class UsersController < ApplicationController
    def show
        user = User.find(params["id"])
        render json: {user: user}
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
end
