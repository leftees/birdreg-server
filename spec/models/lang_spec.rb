require 'rails_helper'

RSpec.describe Lang, type: :model do
  context "relations" do
    it { should have_many(:birdnames) }
    it { should have_many(:birdcatnames) }
  end
  context "validations" do
    it { should validate_presence_of(:name) }
  end
end
