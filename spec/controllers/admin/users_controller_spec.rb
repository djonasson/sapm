require 'spec_helper'

module Admin
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
          response.should redirect_to(edit_admin_user_path(assigns(:user)))
        end
        it "renders new if there are errors" do
          post 'create', user: { }
          response.should render_template("new")
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
        let(:user) { FactoryGirl.create(:user) }
        it "returns http success" do
          put 'update', id: user.id, user:  { name: 'name' }
          response.should redirect_to(edit_admin_user_path(user))
        end
        it "renders edit if there are errors" do
          put 'update', id: user.id, user:  { email: '' }
          response.should render_template("edit")
        end
      end

      describe "DELETE 'destroy'" do
        it "returns http success" do
          user = FactoryGirl.create(:user)
          delete 'destroy', id: user.id
          response.should redirect_to(admin_users_path)
        end
        it "redirects to index if user can't be deleted" do
          user = FactoryGirl.create(:administrator)
          delete 'destroy', id: user.id
          response.should redirect_to(admin_users_path)
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
end
