Rails.application.routes.draw do
  resources :tempatures
  root 'home#index'
end
