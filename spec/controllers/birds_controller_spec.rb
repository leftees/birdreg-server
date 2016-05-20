require 'rails_helper'

RSpec.describe BirdsController, type: :controller do
  describe "show" do
    context "bird" do
      it "should return json-api with birdcat relation and sideload" do
        bird = create(:named_bird)
        get :show, id: bird.id
        expect(json['data']).to_not be(nil)
        expect(json['data']['attributes']['name']).to_not be(nil)
        expect(json['data']['attributes']['name']['en']).to eq(bird.name(lang: 'en'))
        expect(json['included'].first['attributes']['name']['en']).to eq(bird.birdcat.name(lang: 'en'))
      end
    end
  end
end
