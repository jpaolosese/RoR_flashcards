

class SessionsController < ApplicationController
  def create
    # Get request body
    login_data = JSON.parse(request.body.read)
    user = User.find_by(email: login_data['email'])
    if user&.authenticate(login_data['password'])
      render json: {token: JsonWebToken.encode(user_id: user.id),
                    user_id: user.id,
                    user_first_name: user.first_name,
                    user_last_name: user.last_name,
                    user_email: user.email},
             status: :created
    else
      render json: {message: 'Invalid email or password'},
             status: :unauthorized
    end
  end
end
