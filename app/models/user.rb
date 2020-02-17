require 'JSON'

class User < ApplicationRecord
    has_many :transactions
    has_secure_password

    validates_presence_of :password_digest
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :email

    validates :email, uniqueness: true
    
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

    def password=(new_password)
        salt = BCrypt::Engine::generate_salt
        hashed = BCrypt::Engine::hash_secret(new_password, salt)
        self.password_digest = salt + hashed
    end

    def authenticate(password)
        salt = password_digest[0..28]
        hashed = BCrypt::Engine::hash_secret(password, salt)
        return nil unless (salt + hashed) == self.password_digest
        return true
    end

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def stocks
        stock_hash = {}
        self.transactions.map { |s| 
            if stock_hash[s.stock]
                stock_hash[s.stock] += s.quantity
            else
                stock_hash[s.stock] = s.quantity
            end 
        }
        stockArr = []
        stock_hash.keys.each { |s| 
            stock = {}
            raw = RestClient.get("https://sandbox.iexapis.com/stable/stock/#{s.downcase}/book?token=Tsk_75f8a00ef1ce400a9de5671974e6f490")
            parsedRaw = JSON.parse(raw)
            stock["name"] = s
            stock["current_price"] = parsedRaw["quote"]["latestPrice"]
            if !parsedRaw["quote"]["open"]
                stock["opening_price"] = parsedRaw["quote"]["latestPrice"]
            else
                stock["opening_price"] = parsedRaw["quote"]["open"]
            end
            stock["shares"] = stock_hash[s]
            stockArr << stock
        }
        return stockArr
    end
end
