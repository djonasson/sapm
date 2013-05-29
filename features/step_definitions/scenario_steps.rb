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

Given(/^a scenario called ([\w\s]+) exists for the feature (\w+)$/) do |scenario_name, feature_name|
  feature = get_feature_from_name(feature_name)
  scenario = set_scenario_from_name(scenario_name, FactoryGirl.create(:scenario, feature: feature))
  feature.scenarios << scenario
end

Given(/^I'm on the edit scenario ([\w\s]+) page$/) do |name|
  scenario = get_scenario_from_name(name)
  visit edit_project_category_feature_scenario_path(scenario.feature.category.project, scenario.feature.category, scenario.feature, scenario)
end

When(/^I edit the scenario with valid data$/) do
  scenario = FactoryGirl.build(:scenario)
  fill_in "scenario_name", with: scenario.name
  fill_in "scenario_description", with: scenario.description
  click_on 'Update Scenario'
end

When(/^I edit scenario (\w+) forgetting to give a name$/) do |name|
  fill_in "scenario_name", with: ''
  click_on 'Update Scenario'
end
