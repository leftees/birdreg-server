require 'rails_helper'

RSpec.describe Person, type: :model do
  context "relations" do
    it { should have_many(:participants) }
    it { should have_many(:observations).through(:participants) }
    it { should have_many(:birdimages) }
  end
  context "validations" do
    it { should validate_presence_of(:name) }
  end
end
