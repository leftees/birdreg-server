require 'rails_helper'

RSpec.describe Lang, type: :model do
  it { should have_many(:birdnames) }
  it { should have_many(:birdcatnames) }
  it { should validate_presence_of(:name) }
end
