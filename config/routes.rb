Rails.application.routes.draw do
  resources :whispers do
    collection do
      post :confirm
    end
  end
end
