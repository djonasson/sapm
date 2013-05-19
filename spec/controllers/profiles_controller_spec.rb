require 'spec_helper'

describe ProfilesController do

  let(:user) { FactoryGirl.create(:user) }

  before do
    user.confirm!
  end

  context "authenticated user" do
    before do
      sign_in(user)
    end
    describe "GET 'show'" do
      it "returns http success" do
        get 'show', id: user.id
        response.should be_success
      end
    end
  end

  context "visitor" do
    describe "GET 'show'" do
      it "returns http error" do
        get 'show', id: user.id
        response.should_not be_success
      end
    end
  end

end
