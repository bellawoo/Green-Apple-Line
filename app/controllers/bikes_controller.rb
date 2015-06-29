class BikesController < ApplicationController
  def show
    @locate = Bike.distance params[:lat], params[:long]
  end
end
