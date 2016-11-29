Rails.application.routes.draw do
  root "urlshorteners#index"
  resources :urlshorteners
  get '/:shortened', to: 'urlshorteners#link' , :as => 'access_urlshorteners' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
