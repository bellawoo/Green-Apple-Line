class TrainsController < ApplicationController
  def show
    @locate = Train.closest_station params[:lat], params[:long]
  end
end