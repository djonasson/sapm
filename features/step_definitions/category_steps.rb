Given(/^I'm assigned the project (\w+)$/) do |name|
  project = get_project_from_name(name)
  @i.projects << project
end

Given(/^I'm on the edit project (\w+) page$/) do |name|
  project = get_project_from_name(name)
  visit edit_admin_project_path(project)
end

Given(/^I click New Category$/) do
  click_on 'New Category'
end

#When(/^I enter valid data for a new category$/) do
#  pending # express the regexp above with the code you wish you had
#end

#Then(/^I should see a successful category creation message$/) do
#  pending # express the regexp above with the code you wish you had
#end
