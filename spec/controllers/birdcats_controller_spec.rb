require 'rails_helper'

RSpec.describe BirdcatsController, type: :controller do
  describe "index" do
    before :each do
      @top_birdcat1 = create(:top_birdcat)
      @top_birdcat2 = create(:top_birdcat)
      @birdcats = create_list(:sub_birdcat, 4, parent: @top_birdcat1)
      @birdcats += create_list(:sub_birdcat, 6, parent: @top_birdcat2)
    end
    context "all birdcats" do
      it "should list all birdcats" do
        get :index, show_all: true
        expect(json['data'].size).to eq(12)
        expect(jsonapi.data[2].name['en']).to eq(@birdcats[0].name(lang: 'en'))
        # Not testing for parents because they are already in the complete list,
        # hence not included separately
      end
    end

    context "all top birdcats" do
      it "should list them with their sub birdcats as relations" do
        get :index, show_all: true, level: 'top'
        expect(json['data'].size).to eq(2)
        expect(jsonapi.data[0].name['en']).to eq(@top_birdcat1.name(lang: 'en'))
        expect(jsonapi.included[@birdcats[0]].name['en']).to eq(@birdcats[0].name(lang: 'en'))
      end
    end
    
    context "all sub birdcats" do
      it "should list them with their parents as relations" do
        get :index, show_all: true, level: 'sub'
        expect(json['data'].size).to eq(10)
        expect(jsonapi.data[0].name['en']).to eq(@birdcats[0].name(lang: 'en'))
        expect(jsonapi.included[@top_birdcat1].name['en']).to eq(@top_birdcat1.name(lang: 'en'))
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
        expect(pagination['pages']).to eq(3)
        expect(pagination['records']).to eq(12)
      end

      it "should get the first page if not specified" do
        get :index
        pagination = json['meta']['pagination']
        expect(pagination['page']).to eq(1)
      end
    end
  end
  
  describe "show" do
    context "birdcat at top level" do
      it "should return json-api without a parent" do
        birdcat = create(:top_birdcat)
        get :show, id: birdcat.id
        expect(jsonapi.data.name['en']).to eq(birdcat.name(lang: 'en'))
      end
    end

    context "birdcat at sub level" do
      it "should return json-api with a parent" do
        birdcat = create(:sub_birdcat)
        get :show, id: birdcat.id
        expect(jsonapi.data.name['en']).to eq(birdcat.name(lang: 'en'))
        expect(jsonapi.included[birdcat.parent].name['en']).to eq(birdcat.parent.name(lang: 'en'))
      end
    end
  end
end
