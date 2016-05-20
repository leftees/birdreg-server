require 'rails_helper'

RSpec.describe BirdcatsController, type: :controller do
  describe "show" do
    context "birdcat at top level" do
      it "should return json-api without a parent" do
        birdcat = create(:top_birdcat)
        get :show, id: birdcat.id
        expect(json['data']).to_not be(nil)
        expect(json['data']['attributes']['name']).to_not be(nil)
        expect(json['data']['attributes']['name']['en']).to eq(birdcat.name(lang: 'en'))
      end
    end

    context "birdcat at sub level" do
      it "should return json-api with a parent" do
        birdcat = create(:sub_birdcat)
        get :show, id: birdcat.id
        expect(json['data']).to_not be(nil)
        expect(json['data']['attributes']['name']).to_not be(nil)
        expect(json['data']['attributes']['name']['en']).to eq(birdcat.name(lang: 'en'))
        expect(json['included'].first['attributes']['name']['en']).to eq(birdcat.parent.name(lang: 'en'))
      end
    end
  end
end
