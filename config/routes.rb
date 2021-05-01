Rails.application.routes.draw do
  get '/es', to: 'elasticsearch#index'
end
