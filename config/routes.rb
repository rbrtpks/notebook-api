Rails.application.routes.draw do
  resources :kinds

  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relashionships/kind'

    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relashionships/phones'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/contacts', to: "contacts#index"
end
