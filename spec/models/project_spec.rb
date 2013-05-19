require 'spec_helper'

describe Project do
  it { should have_and_belong_to_many(:users) }
  it { should have_many(:categories) }
  it { should validate_presence_of(:name) }

  describe "display_name" do
    it { should respond_to(:display_name) }
    it "should return the name" do
      subject.name = 'Project Name'
      subject.display_name.should == subject.name
    end
  end
end
