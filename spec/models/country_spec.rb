require 'rails_helper'

RSpec.describe Country, type: :model do
  it { should have_many(:places) }
  it { should have_many(:observations).through(:places) }
  it { should validate_presence_of(:name) }
end
