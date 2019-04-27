Rails.application.routes.draw do
  root "films#index"
  resources :films
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
