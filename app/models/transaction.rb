class Transaction < ApplicationRecord
    belongs_to :user

    def validate
        user = User.find_by(id: self.user_id)
        # byebug
        if user.balance - self.price >= 0
            return true
        else
            return false
        end
    end
end
