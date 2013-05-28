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

Given(/^a feature called (\w+) exists for the category (\w+)$/) do |feature_name, category_name|
  category = get_category_from_name(category_name)
  feature = set_feature_from_name(feature_name, FactoryGirl.create(:feature, category: category))
  category.features << feature
end

Given(/^I'm on the edit feature (\w+) page$/) do |name|
  feature = get_feature_from_name(name)
  visit edit_project_category_feature_path(feature.category.project, feature.category, feature)
end

When(/^I edit the feature with valid data$/) do
  feature = FactoryGirl.build(:feature)
  fill_in "feature_name", with: feature.name
  fill_in "feature_description", with: feature.description
  fill_in "feature_background", with: feature.background
  click_on 'Update Feature'
end

When(/^I edit feature Create forgetting to give a name$/) do
  fill_in "feature_name", with: ''
  click_on 'Update Feature'
end
