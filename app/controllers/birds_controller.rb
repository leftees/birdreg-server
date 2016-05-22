class BirdsController < ApplicationController
  def index
    birds = Bird.all
    birds = generic_paginate(resource: birds)
    render json: birds, include: 'birdcat', meta: meta_attributes(resource: birds)
  end
  
  def show
    bird = Bird.find_by_id(params[:id])
    render json: bird, include: 'birdcat'
  end
end
