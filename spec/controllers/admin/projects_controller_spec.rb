require 'spec_helper'

module Admin
  describe ProjectsController do

    context "administrator" do
      before do
        sign_in_as_administrator
      end
      after do
        Project.destroy_all
      end

      describe "GET 'index'" do
        it "returns http success" do
          get 'index'
          response.should be_success
        end
      end

      describe "GET 'show'" do
        it "returns http success" do
          resource = FactoryGirl.create(:project)
          get 'show', id: resource.id
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
          post 'create', project: { name: 'My Project' }
          response.should redirect_to(edit_admin_project_path(assigns(:project)))
        end
        it "renders new if there are errors" do
          post 'create', project: { }
          response.should render_template("new")
        end
      end

      describe "GET 'edit'" do
        it "returns http success" do
          resource = FactoryGirl.create(:project)
          get 'edit', id: resource.id
          response.should be_success
        end
      end

      describe "PUT 'update'" do
        let(:resource) { FactoryGirl.create(:project) }
        it "returns http success" do
          put 'update', id: resource.id, project:  { name: 'name' }
          response.should redirect_to(edit_admin_project_path(resource))
        end
        it "renders edit if there are errors" do
          put 'update', id: resource.id, project:  { name: '' }
          response.should render_template("edit")
        end
      end

      describe "DELETE 'destroy'" do
        it "returns http success" do
          resource = FactoryGirl.create(:project)
          delete 'destroy', id: resource.id
          response.should redirect_to(admin_projects_path)
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
          resource = FactoryGirl.create(:project)
          get 'show', id: resource.id
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
          post 'create', project: { name: 'My Project' }
          response.should redirect_to(new_user_session_path)
        end
      end

      describe "GET 'edit'" do
        it "returns http success" do
          resource = FactoryGirl.create(:project)
          get 'edit', id: resource.id
          response.should redirect_to(new_user_session_path)
        end
      end

      describe "PUT 'update'" do
        it "returns http success" do
          resource = FactoryGirl.create(:project)
          put 'update', id: resource.id, project:  { name: 'name' }
          response.should redirect_to(new_user_session_path)
        end
      end

      describe "DELETE 'destroy'" do
        it "returns http success" do
          resource = FactoryGirl.create(:project)
          delete 'destroy', id: resource.id
          response.should redirect_to(new_user_session_path)
        end
      end
    end

  end
end
