class UsersController < ApplicationController
    def show
        user = get_user_from_token

        render json: {
            message: "You have been successfully authenticated",
            user: user
        }
    end

    private

    def get_user_from_token
        jwt_payload = JWT.decode(request.headers["Authorization"].split(' ')[1], 
                                Rails.application.credentials.devise[:jwt_secret_key]).first
        user_id = jwt_payload["sub"]
        user = User.find(user_id.to_s)
        user
    end
end
