class PlacesController < ApplicationController
  def index
    places = Place.order(:country_id, :municipal, :obsplace)
    places = generic_paginate(resource: places)
    render json: places, meta: meta_attributes(resource: places)
  end
  
  def show
    place = Place.find_by_id(params[:id])
    render json: place
  end
end
