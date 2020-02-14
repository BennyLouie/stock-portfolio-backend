class TransactionsController < ApplicationController
    skip_before_action :require_login, only: :create
    
    def create
        # byebug
        transaction = Transaction.new(transaction_params)
        if transaction.valid?
            transaction.save
            render json: transaction
        else
            render json: {errors: transaction.errors.full_messages}
        end

    end

    private

    def transaction_params
        params.permit(:user_id, :stock, :price, :quantity)
    end
end
