require 'rails_helper'

RSpec.describe RoofSet, :type => :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:buildings) }
  it { should belong_to(:user) }
end