require 'rails_helper'

RSpec.describe Participant, type: :model do
  context "relations" do
    it { should belong_to(:person) }
    it { should belong_to(:observation) }
  end
  context "validations" do
    it { should validate_presence_of(:person) }
    it { should validate_presence_of(:observation) }
  end
end
