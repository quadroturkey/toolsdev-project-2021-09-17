Rails.application.routes.draw do
  root 'home#index'

  get "/conditions", to: "condition#index"
end
