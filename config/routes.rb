Rails.application.routes.draw do
  root 'nodes#show'
  resources :nodes
end
