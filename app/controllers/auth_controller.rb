class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]

    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            payload = { user_id: user.id }
            token = encode_token(payload)
            render json: { user: user, stocks: user.stocks, transactions: session_user.transactions, jwt: token, success: "Welcome back, #{user.first_name}"}
        else 
            render json: { errors: "Invalid Email or Password!"}
        end
    end

    def auto_login
        if session_user
            render json: {user: session_user, stocks: session_user.stocks, transactions: session_user.transactions}
        else 
            render json: { errors: "No User Logged In"}
        end
    end
end
