require 'rails_helper'

RSpec.describe Birdcatname, type: :model do
  it { should belong_to(:lang) }
  it { should belong_to(:birdcat) }
  it { should validate_presence_of(:lang) }
  it { should validate_presence_of(:name) }
end
