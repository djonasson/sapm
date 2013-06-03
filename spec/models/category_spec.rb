require 'spec_helper'

describe Category do
  it { should validate_presence_of(:name) }
  it { should belong_to(:project) }
  it { should have_many(:features) }
  it { should have_many(:scenarios).through(:features) }
  it { should validate_numericality_of(:position).only_integer }

  describe "display_name" do
    it { should respond_to(:display_name) }
    it "should return the name" do
      subject.name = 'Category Name'
      subject.display_name.should == subject.name
    end
  end

  describe "move_to_position" do
    before :each do
      @parent = FactoryGirl.create(:category, project: FactoryGirl.create(:project))
      @parent.children << @cat_a = FactoryGirl.create(:category, parent: @parent)
      @parent.children << @cat_b = FactoryGirl.create(:category, parent: @parent)
      @parent.children << @cat_c = FactoryGirl.create(:category, parent: @parent)
    end
    context "moving second category before first" do
      before do
        @cat_b.move_to_position 0
        [@cat_a, @cat_b, @cat_c].map(&:reload)
      end
      it "should get position 0" do
        @cat_b.position.should == 0
      end
      it "should move first category to second position" do
        @cat_a.position.should == 1
      end
      it "should leave the third category in the third position" do
        @cat_c.position.should == 2
      end
    end
    context "moving first category after second" do
      before do
        @cat_a.move_to_position 1
        [@cat_a, @cat_b, @cat_c].map(&:reload)
      end
      it "should get position 1" do
        @cat_a.position.should == 1
      end
      it "should move second category to the first position" do
        @cat_b.position.should == 0
      end
      it "should leave the third category in the third position" do
        @cat_c.position.should == 2
      end
    end
    context "moving third category before first" do
      before do
        @cat_c.move_to_position 0
        [@cat_a, @cat_b, @cat_c].map(&:reload)
      end
      it "should get position 0" do
        @cat_c.position.should == 0
      end
      it "should move the second category to the third position" do
        @cat_b.position.should == 2
      end
      it "should move the first category to the second position" do
        @cat_a.position.should == 1
      end
    end
    context "moving first category after third" do
      before do
        @cat_a.move_to_position 2
        [@cat_a, @cat_b, @cat_c].map(&:reload)
      end
      it "should get position 2" do
        @cat_a.position.should == 2
      end
      it "should move the second category to the first position" do
        @cat_b.position.should == 0
      end
      it "should move the third category to the second position" do
        @cat_c.position.should == 1
      end
    end
  end

end
