require 'rails_helper'

RSpec.describe Birdcat, type: :model do
  it { should belong_to(:parent).with_foreign_key(:birdcat_id).class_name("Birdcat") }
  it { should have_many(:birdcats) }
  it { should have_many(:birdcatnames) }
  it { should have_many(:birds) }
end
