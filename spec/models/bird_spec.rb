require 'rails_helper'

RSpec.describe Bird, type: :model do
  it { should belong_to(:birdcat) }
  it { should have_many(:birdnames) }
  it { should have_many(:birdimages) }
  it { should have_many(:observation_items) }
  it { should have_many(:observations).through(:observation_items) }
  it { should validate_presence_of(:birdcat) }
  it { should validate_presence_of(:birdnames) }
end
