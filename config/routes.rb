Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users

      resources :seats
      resources :bookings
    end
  end
end
