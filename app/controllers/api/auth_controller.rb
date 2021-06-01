class Api::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
# Create path for fetch request in frontend

    def create
        @user = User.find_by(email: user_login_params[:emial])
        if @user && @user.authenticate(user_login_params[:password])
            token = encode_token({ user_id: @user.id })
            cookies.signed[:jwt] = {value:  token, httponly: true}
            render json: { user: @user, jwt: token }, status: :accepted
          else
            render json: { message: 'Invalid username or password' }, status: :unauthorized
          end
    end

    private

    def user_login_params
      params.require(:user).permit(:email, :password)
    end

end
