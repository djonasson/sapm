Given(/^I'm on the new project page$/) do
  visit new_admin_project_path
end

When(/^I enter valid data for a new project$/) do
  project = FactoryGirl.build(:project)
  fill_in "project_name", with: project.name
  click_on 'Create Project'
end

Then(/^I should be on the edit page for the project$/) do
  current_path.should == edit_admin_project_path(Project.last)
end

When(/^I forget to enter a project name$/) do
  fill_in "project_name", with: ''
  click_on 'Create Project'
end

Then(/^I should see a name required message$/) do
  find('.project_name').should have_content("can't be blank")
end

Given(/^a project called (\w+) exists$/) do |name|
  set_project_from_name(name)
end

When(/^I edit project (\w+) with valid data$/) do |name|
  project = get_project_from_name(name)
  visit edit_admin_project_path(project)
  fill_in "project_name", with: project.name
  click_on 'Update Project'
end

Then(/^I should be on the admin edit page for project (\w+)$/) do |name|
  project = get_project_from_name(name)
  current_path.should == edit_admin_project_path(project)
end

Then(/^I should be on the edit page for project (\w+)$/) do |name|
  project = get_project_from_name(name)
  current_path.should == edit_project_path(project)
end

When(/^I edit project (\w+) forgetting to give a name$/) do |name|
  project = get_project_from_name(name)
  visit edit_admin_project_path(project)
  fill_in "project_name", with: ''
  click_on 'Update Project'
end

Given(/^I'm on the projects list page$/) do
  visit admin_projects_path
end

Then(/^I should see the name of the project (\w+)$/) do |name|
  project = get_project_from_name(name)
  page.should have_content project.name
end

When(/^I click on the show button for project (\w+)$/) do |name|
  project = get_project_from_name(name)
  within("#project_#{project.id}") { click_on "Show" }
end

Then(/^I should be on the show page for project (\w+)$/) do |name|
  project = get_project_from_name(name)
  current_path.should == admin_project_path(project)
end
