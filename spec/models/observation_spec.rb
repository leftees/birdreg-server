require 'rails_helper'

RSpec.describe Observation, type: :model do
  it { should have_many(:participants) }
  it { should have_many(:people).through(:participants) }
  it { should belong_to(:place) }
  it { should have_many(:observation_items) }
  it { should have_many(:birds).through(:observation_items) }
  it { should validate_presence_of(:place) }
  it { should validate_presence_of(:stamp) }
  it { should validate_presence_of(:estamp) }
end
