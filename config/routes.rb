Rails.application.routes.draw do
  resources :users do
    member do
      post 'create_token'
    end
  end
end
