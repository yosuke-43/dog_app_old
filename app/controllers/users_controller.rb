class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(user_params[:email], user_params[:password]) #ユーザー登録後ログインを自動で行う
            redirect_back_or_to root_path, success: '会員登録が完了しました'
        else
            flash.now[:danger] = '会員登録に失敗しました'
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
end
