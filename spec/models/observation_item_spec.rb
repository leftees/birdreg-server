require 'rails_helper'

RSpec.describe ObservationItem, type: :model do
  context "relations" do
    it { should belong_to(:observation) }
    it { should belong_to(:bird) }
  end
  context "validations" do
    it { should validate_presence_of(:observation) }
    it { should validate_presence_of(:bird) }
    it { should validate_presence_of(:count) }
    it { should validate_numericality_of(:count).only_integer.is_greater_than(0) }
  end
end
