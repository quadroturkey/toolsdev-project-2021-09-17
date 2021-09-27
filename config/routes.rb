Rails.application.routes.draw do
  root 'home#index'

  get "/api/conditions", to: "condition#index"
  get "/api/condition/:id", to: "condition#show"
  post "/api/condition", to: "condition#create"
  put "/api/condition/:id", to: "condition#update"
  delete "/api/condition/:id", to: "condition#destroy"
end
