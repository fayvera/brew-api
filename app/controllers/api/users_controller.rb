class Api::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :create]
    skip_before_action :authorized, only: [:create]

    def create
        if !@user
            @user = User.create(user_params)
            if @user.valid? 
                @token = encode_token(user_id: @user.id)
                render json: { user: @user, jwt: @token }, status: :created
            else
                render json: { error: 'failed to create user' }, status: :not_acceptable
            end 
        else 
            render json: { error: 'User already exists. Please use another email.' }, status: :not_acceptable 
        end
    end

    def show
        render json: @user.current_user
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
        params.require(:user).permit(:name, :email, :password)
    end
end


