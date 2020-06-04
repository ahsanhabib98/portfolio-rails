Rails.application.routes.draw do
  devise_for :users
  resources :services, except: [:show]
  get 'service/:id', to: 'services#show', as: 'service_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
