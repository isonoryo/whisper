Rails.application.routes.draw do
  root to: 'whispers#index'
  resources :whispers do
    collection do
      post :confirm
    end
  end
end
