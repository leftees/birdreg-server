class BirdsController < ApplicationController
  def show
    bird = Bird.find_by_id(params[:id])
    render json: bird, include: 'birdcat'
  end
end
