class AuthController < ApplicationController

    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            payload = { user_id: user.id }
            token = encode_token(payload)
            render json: { user: user, jwt: token, success: "Welcome back, #{user.first_name}"}
        else 
            render json: { failure: "Invalid Email or Password!"}
        end
    end

    def auto_login
        if session_user
            render json: session_user
        else 
            render json: { error: "No User Logged In"}
        end
    end
end
