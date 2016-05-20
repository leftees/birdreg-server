require 'rails_helper'

RSpec.describe Country, type: :model do
  context "relations" do
    it { should have_many(:places) }
    it { should have_many(:observations).through(:places) }
  end
  context "validations" do
    it { should validate_presence_of(:name) }
  end
end
