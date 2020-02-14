class TransactionsController < ApplicationController
    
    def create
        transaction = Transaction.create(transaction_params)
        
    end

    private

    def transaction_params
        params.permit(:user_id, :stock, :price, :quantity)
    end
end
