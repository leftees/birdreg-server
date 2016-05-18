require 'rails_helper'

RSpec.describe Bird, type: :model do
  it { should belong_to(:birdcat) }
  it { should have_many(:birdnames) }
  it { should have_many(:birdimages) }
  it { should have_many(:observation_items) }
  it { should have_many(:observations).through(:observation_items) }

  it "should have json with proper names" do
    bird = create(:named_bird)
    name_en = bird.birdnames.where(lang: Lang.find_by_name("en")).first
    name_sv = bird.birdnames.where(lang: Lang.find_by_name("sv")).first
    json = JSON.parse(bird.to_json)
    expect(json['name_en']).to eq(name_en.name)
    expect(json['name_sv']).to eq(name_sv.name)
  end
end
