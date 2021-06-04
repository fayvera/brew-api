class Api::UsersController < ApplicationController
    before_action :set_user, only: [:update, :destroy]
    before_action :current_user, only: [:show]
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.create(user_params)
        if @user.valid? 
            @token = encode_token(user_id: @user.id)
            render json: { user: @user, jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
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

    # def index

    # end


    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end


