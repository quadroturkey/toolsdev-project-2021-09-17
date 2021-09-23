Rails.application.routes.draw do
  root 'home#index'

  get "/conditions", to: "condition#index"
  post "/condition", to: "condition#create"
end
