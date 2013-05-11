def sign_in(user)
  visit new_user_session_path
  fill_in "user_email", with: user.email
  fill_in "user_password", with: user.password
  click_button "Sign in"
end

def sign_in_as_administrator
  administrator = FactoryGirl.create(:administrator)
  administrator.confirm!
  sign_in administrator
end

def set_user_from_name(name)
  user = FactoryGirl.create(:user, name: name)
  instance_variable_set("@user_#{name.downcase}", user)
end

def get_user_from_name(name)
  instance_variable_get("@user_#{name.downcase}")
end
