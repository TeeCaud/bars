Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'
  get '/bars', to: 'bars#index'
  get '/bars/:id', to: 'bars#show'
end
