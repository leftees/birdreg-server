require 'rails_helper'

RSpec.describe BirdsController, type: :controller do
  describe "index" do
    before :each do
      @birdcat1 = create(:named_birdcat)
      @birdcat2 = create(:named_birdcat)
      @birds = create_list(:named_bird, 6, {birdcat: @birdcat1})
      @birds += create_list(:named_bird, 4, {birdcat: @birdcat2})
    end
    context "all birds" do
      it "should list all birds with related birdcats" do
        get :index, show_all: true
        expect(json['data'].size).to eq(10)
        expect(jsonapi.data[0].name['en']).to eq(@birds[0].name(lang: 'en'))
        expect(jsonapi.included[@birdcat1].name['en']).to eq(@birdcat1.name(lang: 'en'))
      end
    end
    
    context "paginated place list" do
      it "should return a paginated list of birds" do
        get :index, page: {size: 5, number: 1}
        expect(json['data'].size).to eq(5)
      end
      
      it "should have metadata for pagination" do
        get :index, page: {size: 5, number: 1}
        expect(json['meta']).to_not be(nil)
        pagination = json['meta']['pagination']
        expect(pagination['page']).to eq(1)
        expect(pagination['next']).to eq(2)
        expect(pagination['prev']).to eq(nil)
        expect(pagination['pages']).to eq(2)
        expect(pagination['records']).to eq(10)
      end

      it "should get the first page if not specified" do
        get :index
        pagination = json['meta']['pagination']
        expect(pagination['page']).to eq(1)
      end
    end
  end
  
  describe "show" do
    context "bird" do
      it "should return json-api with birdcat relation and sideload" do
        bird = create(:named_bird)
        get :show, id: bird.id
        expect(jsonapi.data.name['en']).to eq(bird.name(lang: 'en'))
        expect(jsonapi.included[bird.birdcat].name['en']).to eq(bird.birdcat.name(lang: 'en'))
      end
    end
  end
end
