Given(/^I click New Scenario$/) do
  click_on 'New Scenario'
end

When(/^I enter valid data for a new scenario$/) do
  scenario = FactoryGirl.build(:scenario)
  fill_in "scenario_name", with: scenario.name
  click_on 'Create Scenario'
end

When(/^I forget to enter a scenario name$/) do
  fill_in "scenario_name", with: ''
  click_on 'Create Scenario'
end

Then(/^I should see a scenario name required message$/) do
  find('.scenario_name').should have_content("can't be blank")
end
