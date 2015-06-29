class BusesController < ApplicationController
  def show
    @locate = Bus.closest_stop params[:lat], params[:long]
  end
end