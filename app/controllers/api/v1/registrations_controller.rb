module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      # POST /api/users
      def create
        user = User.new(sign_up_params)
        if user.save
          render json: { status: 'success', message: 'User created successfully.', user: user }, status: :created
        else
          render json: { status: 'error', message: 'User creation failed.', errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
