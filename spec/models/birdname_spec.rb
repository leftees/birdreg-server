require 'rails_helper'

RSpec.describe Birdname, type: :model do
  it { should belong_to(:lang) }
  it { should belong_to(:bird) }
  it { should validate_presence_of(:lang) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:bird) }
end
