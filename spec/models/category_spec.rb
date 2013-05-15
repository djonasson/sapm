require 'spec_helper'

describe Category do
  it { should validate_presence_of(:name) }
  it { should belong_to(:project) }
  it { should validate_numericality_of(:position).only_integer }
end
