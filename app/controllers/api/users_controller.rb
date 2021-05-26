class Api::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def create
        @user = User.new(params)
        if @user.save
            render json: @user
        else
            render json: @user.errors
        end        
    end

    def show
        render json: @user
    end

    def update
        if @user.update(params)
            render json: @user
        else
            render json: @user.errors
        end
    end

    def destroy
        @user.destroy
    end


    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password_digest)
    end
end


