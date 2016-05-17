require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should have_many(:participants) }
  it { should have_many(:observations).through(:participants) }
  it { should have_many(:birdimages) }
  it { should validate_presence_of(:name) }
end
