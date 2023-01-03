Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  resources :users do
    resources :workers
  end

  root "workers#index"
end
