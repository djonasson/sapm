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



# =============================================================================
# edit.feature
# =============================================================================


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
  pending # express the regexp above with the code you wish you had
end

Given(/^My account has been confirmed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am not logged in$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in with valid credentials$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a successful sign in message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I return to the site$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be signed in$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I do not exist as a user$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see an invalid login message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be signed out$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^My account has not been confirmed$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an unconfirmed account message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in with no e\-mail$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a missing e\-mail message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in with no password$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a missing password message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in with a wrong password$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am logged in$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign out$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a signed out message$/) do
  pending # express the regexp above with the code you wish you had
end
