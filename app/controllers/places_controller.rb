class PlacesController < ApplicationController
  def index
    places = Place.order(:country_id, :municipal, :obsplace)
    if params[:show_all]
      places = places.paginate(page: 1, per_page: 2**31)
    elsif params[:page]
      places = places.paginate(per_page: params[:page][:size], page: params[:page][:number])
    else
      places = places.paginate(page: 1, per_page: 30)
    end
    render json: places, meta: meta_attributes(resource: places)
  end
  
  def show
    place = Place.find_by_id(params[:id])
    render json: place
  end
end
