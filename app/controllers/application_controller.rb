class ApplicationController < ActionController::API

    private

    def encode_token(payload)
        JWT.encode(payload, signing_secret, 'HS256')
    end

    def signing_secret
        ENV["JWT_SECRET_KEY"]
    end

end
