class BusController < ApplicationController
  def show
    @locate = Bus.distance params[:lat], params[:long]
  end
end