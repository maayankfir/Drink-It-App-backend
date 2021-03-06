module Api
  module V1
    class UsersController < ApplicationController

      def index
        @users = User.all
        render json: @users
      end

      def create
        @user = User.new(name: params[:name], username: params[:username], password: params[:password])
        if @user.save
          render json: @user
        else
          render json: { error: 'WRONG'}, status: 422
        end
      end

      def login
        @user = User.find_by(user_name: user_params[:user_name])
        if @user && @user.validate(user_params[:password])
          render json: @user
        else
          render json: {error: "wrong username or password"}
        end
      end

      private
      def user_params
        params.require(:user).permit(:name, :user_name, :password)
      end
      
    end

  end
end
