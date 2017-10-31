Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
  resources :driverrides
  resources :passengerrides
  resources :conversations do
    resources :messages
  end
  resources :requestforpms do
    collection do
      post 'updatestatus'
    end
  end
  resources :requestfordms do
    collection do
      post 'updatestatus'
    end
  end
end
