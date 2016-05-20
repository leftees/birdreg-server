require 'rails_helper'

RSpec.describe Birdcatname, type: :model do
  context "relations" do
    it { should belong_to(:lang) }
    it { should belong_to(:birdcat) }
  end
  context "validations" do
    it { should validate_presence_of(:lang) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:birdcat) }
  end
end
