require 'spec_helper'

module Admin
  describe User do
    it { should have_and_belong_to_many(:projects) }
    it { should validate_presence_of(:email) }

    describe "display_name" do
      it { should respond_to(:display_name) }
      it "should return the name if it exists" do
        subject.name = 'User Name'
        subject.display_name.should == subject.name
      end
      it "should return the e-mail address if the name hasn't been set" do
        subject.name = ''
        subject.email = 'test@example.com'
        subject.display_name.should == subject.email
      end
    end
  end
end
