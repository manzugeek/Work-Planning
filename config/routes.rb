Rails.application.routes.draw do

  root "workers#index"

  devise_for :users, controllers: { 
                    registrations: 'registrations',
                    sessions: 'users/sessions'          
                  }   
  resources :users do
    resources :workers
  end

  resources :workers do
    resources :shifts
  end
end
