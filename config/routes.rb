Rails.application.routes.draw do

  root 'image#index'
  # post '/image/download', to: 'image#download'
  # get '/image/download', to: 'image#download'
  # get '/image/create', to: 'image#create'
  get '/api/download', to: 'api#download'
  post '/api/download', to: 'api#download'

end
