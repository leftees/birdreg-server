class ObservationsController < ApplicationController
  def show
    observation = Observation.find_by_id(params[:id])
    render json: observation, include: 'observation_items,place,observation_items.bird,people'
  end
end
