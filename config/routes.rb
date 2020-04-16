Rails.application.routes.draw do
  #show all entries in the index
  get "/celebrities", to: "celebrities#index"
  #just show certain aspects -- in this case a list of names
  get "/celebrities/:name", to: "celebrities#show"
  #add additional content
  post "/celebrities", to: "celebrities#create"
  #change or patch certain parts of site
  put "/celebrities/:name", to: "celebrities#update"
  # remove from app
  delete "/celebrities/:name", to: "celebrities#destroy"
end
