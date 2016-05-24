class ObservationsController < ApplicationController
  def index
    observations = Observation
                   .preload(participants: :person)
                   .preload(:people)
                   .preload(observation_items: {bird: {birdnames: :lang}})
                   .preload(observation_items: {bird: {birdcat: {birdcatnames: :lang}}})
                   .preload(place: :country)
    observations = generic_paginate(resource: observations)
    render json: observations, include: 'observation_items,place,observation_items.bird,people', meta: meta_attributes(resource: observations)
  end
  
  def show
    observation = Observation.find_by_id(params[:id])
    render json: observation, include: 'observation_items,place,observation_items.bird,people'
  end
end
