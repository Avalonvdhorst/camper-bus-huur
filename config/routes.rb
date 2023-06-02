Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bookings, only: %i[new create]
  get "/huurvoorwaarden", to: "pages#huurvoorwaarden"
  get "/admin", to: "pages#admin"
end
