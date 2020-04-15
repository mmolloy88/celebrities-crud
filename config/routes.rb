Rails.application.routes.draw do
  get "/celebrities", to: "celebrities#index"
  get "/celebrities/:name", to: "celebrities#show"
  post "/celebrities", to: "celebrities#create"
  put "/celebrities/:name", to: "celebrities#update"
  delete "/celebrities/:name", to: "celebrities#destroy"
end
