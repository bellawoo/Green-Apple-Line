Rails.application.routes.draw do
  get '/bike' => 'bikes#show'

  get '/train' => 'trains#show'

  get '/bus/:lat/:long' => 'bus#show'
end
