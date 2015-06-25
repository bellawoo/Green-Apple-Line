Rails.application.routes.draw do
  get '/bike' => 'bike#show'

  get '/train/:lat/:long' => 'train#show'

  get '/bus/:lat/:long' => 'bus#show'
end
