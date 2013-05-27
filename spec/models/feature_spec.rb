require 'spec_helper'

describe Feature do
  it { should validate_presence_of(:name) }
  it { should belong_to(:category) }
  it { should validate_numericality_of(:position).only_integer }
end
