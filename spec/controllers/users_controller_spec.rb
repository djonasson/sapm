require 'spec_helper'

describe UsersController do

  context "administrator" do
    before do
      sign_in_as_administrator
    end
    after do
      User.destroy_all
    end

    describe "GET 'index'" do
      it "returns http success" do
        get 'index'
        response.should be_success
      end
    end

    describe "GET 'show'" do
      it "returns http success" do
        user = FactoryGirl.create(:user)
        get 'show', id: user.id
        response.should be_success
      end
    end

    describe "GET 'new'" do
      it "returns http success" do
        get 'new'
        response.should be_success
      end
    end

    describe "POST 'create'" do
      it "returns http success" do
        post 'create', user: { email: 'test@example.com', password: 'p4$$word' }
        response.should redirect_to(edit_user_path(assigns(:user)))
      end
    end

    describe "GET 'edit'" do
      it "returns http success" do
        user = FactoryGirl.create(:user)
        get 'edit', id: user.id
        response.should be_success
      end
    end

    describe "PUT 'update'" do
      it "returns http success" do
        user = FactoryGirl.create(:user)
        put 'update', id: user.id, user:  { name: 'name' }
        response.should redirect_to(edit_user_path(user))
      end
    end

    describe "DELETE 'destroy'" do
      it "returns http success" do
        user = FactoryGirl.create(:user)
        delete 'destroy', id: user.id
        response.should redirect_to(users_path)
      end
    end
  end

  context "visitor" do
    describe "GET 'index'" do
      it "redirects to sign in" do
        get 'index'
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "GET 'show'" do
      it "returns http success" do
        user = FactoryGirl.create(:user)
        get 'show', id: user.id
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "GET 'new'" do
      it "returns http success" do
        get 'new'
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "POST 'create'" do
      it "returns http success" do
        post 'create', user: { email: 'test@example.com', password: 'p4$$word' }
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "GET 'edit'" do
      it "returns http success" do
        user = FactoryGirl.create(:user)
        get 'edit', id: user.id
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "PUT 'update'" do
      it "returns http success" do
        user = FactoryGirl.create(:user)
        put 'update', id: user.id, user:  { name: 'name' }
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "DELETE 'destroy'" do
      it "returns http success" do
        user = FactoryGirl.create(:user)
        delete 'destroy', id: user.id
        response.should redirect_to(new_user_session_path)
      end
    end
  end


end
