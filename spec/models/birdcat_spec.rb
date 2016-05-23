require 'rails_helper'

RSpec.describe Birdcat, type: :model do
  context "relations" do
    it { should belong_to(:parent).with_foreign_key(:birdcat_id).class_name("Birdcat") }
    it { should have_many(:birdcats) }
    it { should have_many(:birdcatnames) }
    it { should have_many(:birds) }
  end

  context "methods" do
    it "should fetch name from language" do
      birdcat = create(:named_birdcat)
      name = birdcat.birdcatnames.where(lang: Lang.find_by_name('en')).first
      
      expect(birdcat.name(lang: 'en')).to eq(name.name)
    end

    it "should return hash of all names if no lang is specified" do
      birdcat = create(:named_birdcat)
      name_en = birdcat.birdcatnames.where(lang: Lang.find_by_name('en')).first
      name_sv = birdcat.birdcatnames.where(lang: Lang.find_by_name('sv')).first
      
      expect(birdcat.name['en']).to eq(name_en.name)
      expect(birdcat.name['sv']).to eq(name_sv.name)
    end
  end
end
