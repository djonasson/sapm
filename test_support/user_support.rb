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
