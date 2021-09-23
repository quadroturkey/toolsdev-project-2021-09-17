Rails.application.routes.draw do
  root 'home#index'

  get "/conditions", to: "condition#index"
  post "/condition", to: "condition#create"
  delete "/condition/:id", to: "condition#destroy"
end
