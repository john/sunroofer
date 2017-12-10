require 'rails_helper'

RSpec.describe Building, :type => :model do
  it { should validate_presence_of(:name) }
  it { should belong_to(:roof_set) }
  it { should belong_to(:user) }
end