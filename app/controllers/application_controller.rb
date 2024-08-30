class ApplicationController < ActionController::API
  private

  def authenticate_user!
    head :unauthorized unless current_user
  end


  def current_user
    @current_user ||= User.find_by(id: params[:user_id])
  end
end
