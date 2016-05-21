class PeopleController < ApplicationController
  def index
    people = Person.order(:id)
    render json: people
  end

  def show
    person = Person.find_by_id(params[:id])
    render json: person
  end
end
