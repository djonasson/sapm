Given(/^I'm assigned the project (\w+)$/) do |name|
  project = get_project_from_name(name)
  @i.projects << project
end

Given(/^I'm on the edit project (\w+) page$/) do |name|
  project = get_project_from_name(name)
  visit edit_project_path(project)
end

Given(/^I click New Category$/) do
  click_on 'New Category'
end

When(/^I forget to enter a category name$/) do
  fill_in "category_name", with: ''
  click_on 'Create Category'
end

Then(/^I should see a category name required message$/) do
  find('.category_name').should have_content("can't be blank")
end

When(/^I enter valid data for a new category$/) do
  category = FactoryGirl.build(:category)
  fill_in "category_name", with: category.name
  click_on 'Create Category'
end

Then(/^I should see a successful category creation message$/) do
  page.should have_content "Successfully created category"
end

Given(/^a category called (\w+) exists for the project (\w+)$/) do |category_name, project_name|
  project = get_project_from_name(project_name)
  @category = FactoryGirl.create(:category, name: category_name, project: project)
end

Given(/^I edit the category$/) do
  visit edit_project_category_path(@category.project, @category)
end

When(/^I edit the category with valid data$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a successful category updated message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I edit category Users forgetting to give a name$/) do
  pending # express the regexp above with the code you wish you had
end

