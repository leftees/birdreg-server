class ObservationItemsController < ApplicationController
  def show
    oi = ObservationItem
         .where(id: params[:id])
         .preload(bird: {birdnames: :lang})
         .preload(bird: :birdcat)
    render json: oi.first, include: 'bird'
  end
end
