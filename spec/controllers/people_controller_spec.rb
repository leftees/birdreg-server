require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe "index" do
    context "person" do
      it "should list all people sorted by id" do
        people = []
        people << create(:person, id: 10)
        people << create(:person, id: 5)
        people << create(:person, id: 20)
        first_person = create(:person, id: 3)
        people << first_person
        people << create(:person, id: 6)
        get :index
        expect(jsonapi.data[0]._id).to eq(first_person.id.to_s)
        expect(jsonapi.data[0].name).to eq(first_person.name)
      end
    end
  end
  
  describe "show" do
    context "person" do
      it "should return json-api with person data" do
        person = create(:visible_person)
        get :show, id: person.id
        expect(jsonapi.data.name).to eq(person.name)
        expect(jsonapi.data.info).to eq(person.info)
        expect(jsonapi.data.visible).to eq(person.visible)
      end
    end
  end

end
