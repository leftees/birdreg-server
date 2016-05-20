require 'rails_helper'

RSpec.describe Birdimage, type: :model do
  context "relations" do
    it { should belong_to(:bird) }
    it { should belong_to(:place) }
    it { should belong_to(:person) }
  end
  context "validations" do
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:person) }
  end
end
