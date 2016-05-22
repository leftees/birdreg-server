class BirdcatsController < ApplicationController
  def index
    birdcats = Birdcat.all
    serializer = BirdcatSerializer
    included = 'parent'
    if params[:level] == "top"
      birdcats = birdcats.where(parent: nil)
      serializer = TopBirdcatSerializer
      included = 'birdcats'
    elsif params[:level] == "sub"
      birdcats = birdcats.where.not(parent: nil)
    end
    birdcats = generic_paginate(resource: birdcats)
    render json: birdcats, each_serializer: serializer, include: included, meta: meta_attributes(resource: birdcats)
  end
  
  def show
    birdcat = Birdcat.find_by_id(params[:id])
    render json: birdcat, include: 'parent'
  end
end

