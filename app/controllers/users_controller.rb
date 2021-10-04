class UsersController < ApplicationController # ログイン機能ユーザー系
    def show
        @user = User.find(params[:id])
    end
end
