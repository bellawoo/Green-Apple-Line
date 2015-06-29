Rails.application.routes.draw do
  get '/bike' => 'bikes#show'

  get '/train' => 'trains#show'

  get '/bus' => 'bus#show'
end
