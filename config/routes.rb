Rails.application.routes.draw do
  root "films#index"
  resources :films do
    member do
      resource :watched, only: %i[create], controller: "films/watched"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
