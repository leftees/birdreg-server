require 'rails_helper'

RSpec.describe Bird, type: :model do
  context "relations" do
    it { should belong_to(:birdcat) }
    it { should have_many(:birdnames) }
    it { should have_many(:birdimages) }
    it { should have_many(:observation_items) }
    it { should have_many(:observations).through(:observation_items) }
  end
  context "validations" do
    it { should validate_presence_of(:birdcat) }
  end

  context "methods" do
    it "should fetch name from language" do
      bird = create(:named_bird)
      name = bird.birdnames.where(lang: Lang.find_by_name('en')).first
      
      expect(bird.name(lang: 'en')).to eq(name.name)
    end
    
    it "should return hash of all names if no lang is specified" do
      bird = create(:named_bird)
      name_en = bird.birdnames.where(lang: Lang.find_by_name('en')).first
      name_sv = bird.birdnames.where(lang: Lang.find_by_name('sv')).first
      
      expect(bird.name['en']).to eq(name_en.name)
      expect(bird.name['sv']).to eq(name_sv.name)
    end
  end
end
