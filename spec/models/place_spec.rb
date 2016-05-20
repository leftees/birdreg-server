require 'rails_helper'

RSpec.describe Place, type: :model do
  context "relations" do
    it { should belong_to(:country) }
    it { should have_many(:observations) }
    it { should have_many(:birdimages) }
  end
  context "validations" do
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:municipal) }
    it { should validate_presence_of(:obsplace) }
  end
end
