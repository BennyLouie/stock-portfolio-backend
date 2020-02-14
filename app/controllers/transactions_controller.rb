class TransactionsController < ApplicationController
    skip_before_action :require_login, only: :create
    
    def create
        # byebug
        transaction = Transaction.new(transaction_params)
        if transaction.validate
            transaction.save
            render json: transaction
        else
            render json: {errors: 'The Transaction is Invalid'}
        end

    end

    private

    def transaction_params
        params.permit(:user_id, :stock, :price, :quantity)
    end
end
