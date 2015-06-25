class ApplicationController < ActionController::Base
  before_action do
  request.format = :json
end

  protect_from_forgery with: :exception
end
