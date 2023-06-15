Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bookings, only: %i[new create] do
    member do
      get "download_pdf"
    end
  end

  get "/huurvoorwaarden", to: "pages#huurvoorwaarden"
  get "/admin", to: "pages#admin"
  get "/admin/block", to: "bookings#block"
  post "admin/block", to: "bookings#block_dates", as: :block_dates
end
