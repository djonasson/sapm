Given(/^I click New Feature$/) do
  click_on 'New Feature'
end

When(/^I enter valid data for a new feature$/) do
  feature = FactoryGirl.build(:feature)
  fill_in "feature_name", with: feature.name
  click_on 'Create Feature'
end

When(/^I forget to enter a feature name$/) do
  fill_in "feature_name", with: ''
  click_on 'Create Feature'
end

Then(/^I should see a feature name required message$/) do
  find('.feature_name').should have_content("can't be blank")
end

