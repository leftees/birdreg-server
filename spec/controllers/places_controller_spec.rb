require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  describe "index" do
    before :each do
      @country1 = create(:country, name: 'Country 1')
      @country2 = create(:country, name: 'Country 2')
      @place1 = create(:place, obsplace: 'Obsplace 1', municipal: 'Municipal 1', country: @country1)
      @place2 = create(:place, obsplace: 'Obsplace 2', municipal: 'Municipal 1', country: @country1)
      @place3 = create(:place, obsplace: 'Obsplace 3', municipal: 'Municipal 2', country: @country2)
      @place4 = create(:place, obsplace: 'Obsplace 4', municipal: 'Municipal 3', country: @country1)
      @place5 = create(:place, obsplace: 'Obsplace 5', municipal: 'Municipal 3', country: @country1)
      @place6 = create(:place, obsplace: 'Obsplace 6', municipal: 'Municipal 3', country: @country1)
    end
    context "all places" do
      it "should list all places sorted by country id, municipal and obsplace" do
        get :index, show_all: true
        expect(jsonapi.data[0]._id).to eq(@place1.id)
        expect(jsonapi.data[1]._id).to eq(@place2.id)
        expect(jsonapi.data[2]._id).to eq(@place4.id)
        expect(jsonapi.data[3]._id).to eq(@place5.id)
        expect(jsonapi.data[4]._id).to eq(@place6.id)
        expect(jsonapi.data[5]._id).to eq(@place3.id)
        expect(jsonapi.data[0].obsplace).to eq(@place1.obsplace)
        expect(jsonapi.data[0].municipal).to eq(@place1.municipal)
        expect(jsonapi.data[0].country).to eq(@country1.name)
        expect(jsonapi.data[5].country).to eq(@country2.name)
      end
    end
    
    context "paginated place list" do
      it "should return a paginated list of places" do
        get :index, page: {size: 5, number: 1}
        expect(jsonapi.data[0]).to_not be(nil)
        expect(jsonapi.data[1]).to_not be(nil)
        expect(jsonapi.data[2]).to_not be(nil)
        expect(jsonapi.data[3]).to_not be(nil)
        expect(jsonapi.data[4]).to_not be(nil)
        expect(jsonapi.data[5]).to be(nil)
        expect(jsonapi.data[0].obsplace).to eq(@place1.obsplace)
        expect(jsonapi.data[0].municipal).to eq(@place1.municipal)
        expect(jsonapi.data[0].country).to eq(@country1.name)
      end
      
      it "should have metadata for pagination" do
        get :index, page: {size: 5, number: 1}
        expect(json['meta']).to_not be(nil)
        pagination = json['meta']['pagination']
        expect(pagination['page']).to eq(1)
        expect(pagination['next']).to eq(2)
        expect(pagination['prev']).to eq(nil)
        expect(pagination['pages']).to eq(2)
        expect(pagination['records']).to eq(6)
      end

      it "should get the first page if not specified" do
        get :index
        pagination = json['meta']['pagination']
        expect(pagination['page']).to eq(1)
      end
    end
  end
  
  describe "show" do
    context "place" do
      it "should return json-api with place data including country" do
        country = create(:country, name: 'Country')
        place = create(:place, country: country)
        get :show, id: place.id
        expect(jsonapi.data.municipal).to eq(place.municipal)
        expect(jsonapi.data.obsplace).to eq(place.obsplace)
        expect(jsonapi.data.info).to eq(place.info)
        expect(jsonapi.data.obsgroup).to eq(place.obsgroup)
        expect(jsonapi.data.country).to eq(country.name)
      end
    end
  end

end
