class PlacesController < ApplicationController
  def index
    places = Place.order(:country_id, :municipal, :obsplace)
    render json: places
  end
  
  def show
    place = Place.find_by_id(params[:id])
    render json: place
  end
end
