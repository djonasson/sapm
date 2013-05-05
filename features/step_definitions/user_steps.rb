Given(/^I'm logged in as an administrator$/) do
  sign_in_as_administrator
end

Given(/^I'm on the new user page$/) do
  visit new_user_path
end

When(/^I enter valid user data$/) do
  user = FactoryGirl.build(:user)
  fill_in "user_email", with: user.email
  fill_in "user_password", with: user.password
  fill_in "user_name", with: user.name
  click_on "Create User"
end

Then(/^I should see a successful user creation message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the edit page for the newly created user$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^a confirmation e\-mail should have been sent to the user$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter an invalid e\-mail$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an invalid e\-mail message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the new user page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I forget to enter an e\-mail$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an e\-mail required message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I forget to enter a password$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a password required message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I forget to enter a password confirmation$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a password confirmation required message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter a mismatched password confirmation$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a mismatched password message$/) do
  pending # express the regexp above with the code you wish you had
end


# =============================================================================
# edit.feature
# =============================================================================


Given(/^another user exists$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I edit the user with valid data$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a successful user updated message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the edit page for the user$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I edit the user with an invalid e\-mail$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I edit the user forgetting an e\-mail$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a e\-mail required message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I edit the user changing e\-mail$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I go to the edit page for the user$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not see a password field$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not see a password confirmation field$/) do
  pending # express the regexp above with the code you wish you had
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
