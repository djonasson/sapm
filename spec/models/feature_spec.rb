require 'spec_helper'

describe Feature do
  it { should validate_presence_of(:name) }
  it { should belong_to(:category) }
  it { should have_many(:scenarios) }
  it { should validate_numericality_of(:position).only_integer }

  describe "display_name" do
    it { should respond_to(:display_name) }
    it "should return the name" do
      subject.name = 'Feature Name'
      subject.display_name.should == subject.name
    end
  end

  describe "move_to_position" do
    before :each do
      @category = FactoryGirl.create(:category, project: FactoryGirl.create(:project))
      @category.features << @feature_a = FactoryGirl.create(:feature, category: @category)
      @category.features << @feature_b = FactoryGirl.create(:feature, category: @category)
      @category.features << @feature_c = FactoryGirl.create(:feature, category: @category)
    end
    context "moving second feature before first" do
      before do
        @feature_b.move_to_position 0
        [@feature_a, @feature_b, @feature_c].map(&:reload)
      end
      it "should get position 0" do
        @feature_b.position.should == 0
      end
      it "should move first feature to second position" do
        @feature_a.position.should == 1
      end
      it "should leave the third feature in the third position" do
        @feature_c.position.should == 2
      end
    end
    context "moving first feature after second" do
      before do
        @feature_a.move_to_position 1
        [@feature_a, @feature_b, @feature_c].map(&:reload)
      end
      it "should get position 1" do
        @feature_a.position.should == 1
      end
      it "should move second feature to the first position" do
        @feature_b.position.should == 0
      end
      it "should leave the third feature in the third position" do
        @feature_c.position.should == 2
      end
    end
    context "moving third feature before first" do
      before do
        @feature_c.move_to_position 0
        [@feature_a, @feature_b, @feature_c].map(&:reload)
      end
      it "should get position 0" do
        @feature_c.position.should == 0
      end
      it "should move the second feature to the third position" do
        @feature_b.position.should == 2
      end
      it "should move the first feature to the second position" do
        @feature_a.position.should == 1
      end
    end
    context "moving first feature after third" do
      before do
        @feature_a.move_to_position 2
        [@feature_a, @feature_b, @feature_c].map(&:reload)
      end
      it "should get position 2" do
        @feature_a.position.should == 2
      end
      it "should move the second feature to the first position" do
        @feature_b.position.should == 0
      end
      it "should move the third feature to the second position" do
        @feature_c.position.should == 1
      end
    end
  end
end
