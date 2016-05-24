require 'rails_helper'

RSpec.describe ObservationItemsController, type: :controller do
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
  
  describe "show" do
    context "observation" do
      it "should return an observation with place, people, observation items and birds" do
        get :show, id: @observation_item1.id
        expect(jsonapi.data.count).to eq(@observation_item1.count)
        expect(jsonapi.included[@bird1]._id).to eq(@bird1.id)
      end
    end
  end
end
