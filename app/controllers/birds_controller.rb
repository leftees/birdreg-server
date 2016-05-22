class BirdsController < ApplicationController
  def index
    birds = Bird.all
    if params[:show_all]
      birds = birds.paginate(page: 1, per_page: 2**31)
    elsif params[:page]
      birds = birds.paginate(per_page: params[:page][:size], page: params[:page][:number])
    else
      birds = birds.paginate(page: 1, per_page: 30)
    end
    render json: birds, include: 'birdcat', meta: meta_attributes(resource: birds)
  end
  
  def show
    bird = Bird.find_by_id(params[:id])
    render json: bird, include: 'birdcat'
  end
end
