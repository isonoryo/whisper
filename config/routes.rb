Rails.application.routes.draw do
  get '/whispers', to: 'whispers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
