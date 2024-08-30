module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json

      # POST /api/login
      def create
        user = User.find_for_database_authentication(email: params[:user][:email])

        if user && user.valid_password?(params[:user][:password])
          sign_in(user)
          render json: { status: 'success', message: 'Logged in successfully.', user: user }, status: :ok
        else
          render json: { status: 'error', message: 'Invalid email or password.' }, status: :unauthorized
        end
      end

      # DELETE /api/logout
      def destroy
        sign_out(current_user)
        render json: { status: 'success', message: 'Logged out successfully.' }, status: :ok
      end
    end

  end
end
