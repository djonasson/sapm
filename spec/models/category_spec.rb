require 'spec_helper'

describe Category do
  it { should validate_presence_of(:name) }
  it { should belong_to(:project) }
  it { should validate_numericality_of(:position).only_integer }

  describe "display_name" do
    it { should respond_to(:display_name) }
    it "should return the name" do
      subject.name = 'Category Name'
      subject.display_name.should == subject.name
    end
  end

end
