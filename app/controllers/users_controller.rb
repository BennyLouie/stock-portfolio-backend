class UsersController < ApplicationController
    skip_before_action :require_login, only: [:create]

    # def show
    #     render json: { user: set_user, stocks: set_user.stocks}
    # end

    def create
        user = User.create(user_params)
        if user.valid?
            payload = { user_id: user.id }
            token = encode_token(payload)
            render json: { user: user, jwt: token}
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:id, :first_name, :last_name, :email, :password, :balance)
    end

    def set_user
        User.find_by(id: params[:id])
    end
end
