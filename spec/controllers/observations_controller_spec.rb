require 'rails_helper'

RSpec.describe ObservationsController, type: :controller do
  before :each do
    @person1 = create(:visible_person)
    @person2 = create(:visible_person)
    @bird1 = create(:named_bird)
    @bird2 = create(:named_bird)
    @observation_item1 = create(:observation_item, bird: @bird1, count: 10)
    @observation_item2 = create(:observation_item, bird: @bird2, count: 5)
    @observation = create(:observation)
    @observation.people += [@person1, @person2]
    @observation.observation_items << @observation_item1
    @observation.observation_items << @observation_item2
  end
  
  describe "index" do
    it "should return a paginated list of observations" do
      get :index
      expect(Time.parse(jsonapi.data[0].stamp).to_i).to eq(@observation.stamp.to_i)
      expect(Time.parse(jsonapi.data[0].estamp).to_i).to eq(@observation.estamp.to_i)
      expect(jsonapi.included[@observation.place]._id).to eq(@observation.place_id)
      expect(jsonapi.included[@person1]._id).to eq(@person1.id)
      expect(jsonapi.included[@observation_item1.bird]._id).to eq(@bird1.id)
    end
  end
  
  describe "show" do
    context "observation" do
      it "should return an observation with place, people, observation items and birds" do
        get :show, id: @observation.id
        expect(Time.parse(jsonapi.data.stamp).to_i).to eq(@observation.stamp.to_i)
        expect(Time.parse(jsonapi.data.estamp).to_i).to eq(@observation.estamp.to_i)
        expect(jsonapi.included[@observation_item1].count).to eq(@observation_item1.count)
        expect(jsonapi.included[@observation_item2].count).to eq(@observation_item2.count)
        expect(jsonapi.included[@bird1]._id).to eq(@bird1.id)
        expect(jsonapi.included[@bird2]._id).to eq(@bird2.id)
        expect(jsonapi.included[@person1]._id).to eq(@person1.id)
        expect(jsonapi.included[@person2]._id).to eq(@person2.id)
      end
    end
  end
end
