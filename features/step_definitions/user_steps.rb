def fill_in_user_form(user, new=true)
  fill_in "user_email", with: user.email
  fill_in "user_name", with: user.name
  button_name = new ? "Create User" : "Update User"
  click_on button_name
end


Given(/^I'm logged in as an administrator$/) do
  sign_in_as_administrator
end

Given(/^I'm on the new user page$/) do
  visit new_user_path
end

When(/^I enter valid user data$/) do
  fill_in_user_form FactoryGirl.build(:user)
end

Then(/^I should see a successful user creation message$/) do
  page.should have_content "Successfully created user"
end

Then(/^I should be on the edit page for the newly created user$/) do
  current_path.should == edit_user_path(User.last)
end

Then(/^a confirmation e\-mail should have been sent to (\w+)/) do |name|
  assert ! ActionMailer::Base.deliveries.empty?
  ActionMailer::Base.deliveries.last.subject.should == 'Confirmation instructions'
end

When(/^I enter an invalid e\-mail$/) do
  fill_in_user_form FactoryGirl.build(:user, email: '-')
end

Then(/^I should see an invalid e\-mail message$/) do
  find('.user_email').should have_content("is invalid")
end

When(/^I forget to enter an e\-mail$/) do
  fill_in_user_form FactoryGirl.build(:user, email: '')
end

Then(/^I should see an e\-mail required message$/) do
  find('.user_email').should have_content("can't be blank")
end



Given(/^a user called (\w+) exists$/) do |name|
  set_user_from_name(name)
end

When(/^I edit (\w+) with valid data$/) do |name|
  user = get_user_from_name(name)
  visit edit_user_path(user)
  fill_in_user_form(user, false)
end

Then(/^I should see a successful user updated message$/) do
  page.should have_content "Successfully updated user"
end

Then(/^I should be on the edit page for (\w+)$/) do |name|
  current_path.should == edit_user_path(get_user_from_name(name))
end

When(/^I edit (\w+) with an invalid e\-mail$/) do |name|
  user = get_user_from_name(name)
  visit edit_user_path(user)
  user.email = 'invalid'
  fill_in_user_form(user, false)
end

When(/^I edit (\w+) forgetting an e\-mail$/) do |name|
  user = get_user_from_name(name)
  visit edit_user_path(user)
  user.email = ''
  fill_in_user_form(user, false)
end

When(/^I edit (\w+) changing e\-mail$/) do |name|
  user = get_user_from_name(name)
  visit edit_user_path(user)
  user.email = 'a' + user.email
  fill_in_user_form(user, false)
end

When(/^I go to the edit page for (\w+)/) do |name|
  visit edit_user_path(get_user_from_name(name))
end

Then(/^I should not see a password field$/) do
  page.should_not have_field('user_password')
end

Then(/^I should not see a password confirmation field$/) do
  page.should_not have_field('user_password_confirmation')
end



Given(/^I exist as a user$/) do
  @i = FactoryGirl.create(:user)
end

Given(/^My account has been confirmed$/) do
  @i.confirm!
end

Given(/^I am not logged in$/) do
  visit destroy_user_session_path
  visit root_path
end

When(/^I sign in with valid credentials$/) do
  visit new_user_session_path
  within('form#new_user') do
    fill_in "user_email", with: @i.email
    fill_in "user_password", with: @i.password
    click_on "Sign in"
  end
end

Then(/^I see a successful sign in message$/) do
  page.should have_content 'Signed in successfully'
end

When(/^I return to the site$/) do
  visit root_url
end

Then(/^I should be signed in$/) do
  page.should have_content 'Sign out'
end

Given(/^I do not exist as a user$/) do
  @i = FactoryGirl.build(:user)
end

Then(/^I see an invalid login message$/) do
  page.should have_content 'Invalid e-mail or password'
end

Then(/^I should be signed out$/) do
  page.should have_content 'Sign in'
end

Given(/^My account has not been confirmed$/) do
  @i.should_not be_confirmed
end

Then(/^I should see an unconfirmed account message$/) do
  page.should have_content 'You have to confirm your account before continuing'
end

When(/^I sign in with no e\-mail$/) do
  visit new_user_session_path
  within('form#new_user') do
    fill_in "user_password", with: @i.password
    click_on "Sign in"
  end
end

Then(/^I see a missing e\-mail message$/) do
  page.should have_content 'Invalid e-mail or password'
end

When(/^I sign in with no password$/) do
  visit new_user_session_path
  within('form#new_user') do
    fill_in "user_email", with: @i.email
    click_on "Sign in"
  end
end

Then(/^I see a missing password message$/) do
  page.should have_content 'Invalid e-mail or password'
end

When(/^I sign in with a wrong password$/) do
  visit new_user_session_path
  within('form#new_user') do
    fill_in "user_email", with: @i.email
    fill_in "user_password", with: @i.password + 'a'
    click_on "Sign in"
  end
end



Given(/^I am logged in$/) do
  @i = FactoryGirl.create(:user)
  @i.confirm!
  visit new_user_session_path
  within('form#new_user') do
    fill_in "user_email", with: @i.email
    fill_in "user_password", with: @i.password
    click_on "Sign in"
  end
end

When(/^I sign out$/) do
  click_on "Sign out"
end

Then(/^I should see a signed out message$/) do
  page.should have_content 'Sign in'
end



Given(/^I'm on the activate account page$/) do
  @i.update_attribute(:encrypted_password, '')
  visit user_confirmation_path confirmation_token: @i.confirmation_token
end

When(/^I choose a valid password$/) do
  fill_in "user_password", with: 'password'
  fill_in "user_password_confirmation", with: 'password'
  click_on "Activate"
end

Then(/^I should see an account confirmed message$/) do
  page.should have_content 'Your account was successfully confirmed'
end

When(/^I give no password$/) do
  fill_in "user_password_confirmation", with: 'password'
  click_on "Activate"
end

When(/^I give no password confirmation$/) do
  fill_in "user_password", with: 'password'
  click_on "Activate"
end

When(/^I give non\-matching password and password confirmation$/) do
  fill_in "user_password", with: 'password1'
  fill_in "user_password_confirmation", with: 'password2'
  click_on "Activate"
end

Then(/^I see a password can't be blank message$/) do
  page.should have_content "Password can't be blank"
end

Then(/^I see a passwords don't match message$/) do
  page.should have_content "Password doesn't match confirmation"
end
