class BirdcatsController < ApplicationController
  def show
    birdcat = Birdcat.find_by_id(params[:id])
    render json: birdcat, include: 'parent'
  end
end

