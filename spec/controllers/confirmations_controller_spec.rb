require 'spec_helper'

describe ConfirmationsController do

  it "should be a child of Devise::ConfirmationsController" do
    controller.class.superclass.should eq Devise::ConfirmationsController
  end

end
