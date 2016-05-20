require 'rails_helper'

RSpec.describe Birdname, type: :model do
  context "relations" do
    it { should belong_to(:lang) }
    it { should belong_to(:bird) }
  end
  context "validations" do
    it { should validate_presence_of(:lang) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bird) }
  end
end
