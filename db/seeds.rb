# =============================================================================
# Users
# =============================================================================

# Administrator
administrator = User.new(name: 'Administrator',
                         email: 'administrator@sapm.local',
                         password: 'password')
administrator.administrator = true
administrator.save
administrator.confirm!

# Developer
developer = User.new(name: 'Developer',
                     email: 'developer@sapm.local',
                     password: 'password')
developer.save
developer.confirm!


# =============================================================================
# Projects
# =============================================================================

project = Project.create(name: "Simple Agile Project Management")

administrator.projects << project
developer.projects << project


# =============================================================================
# Categories
# =============================================================================

categories = [
  category_users      = Category.create(name: "Users", project: project),
  category_projects   = Category.create(name: "Projects", project: project),
  category_categories = Category.create(name: "Categories", project: project),
]
project.categories << categories

[category_users, category_projects, category_categories].each do |category|
  category.children << [
    Category.create(name: "Sub Category 1", project: project),
    Category.create(name: "Sub Category 2", project: project),
  ]
end


# =============================================================================
# Features
# =============================================================================

users_features = [
  Feature.create(
    name: "Confirmation",
    category_id: category_users.id,
    description: %Q{
      In order to get access to protected sections of the site
      As a visitor that has been assigned an account
      I should be able to confirm my e-mail address
    }.strip,
    background: %Q{
      Given I exist as a user
      And My account has not been confirmed
      And I'm on the activate account page
    }.strip,
  ),
  Feature.create(
    name: "Create",
    category_id: category_users.id,
    description: %Q{
      In order to assign people to projects
      As an administrator
      I want to create a new user
    }.strip,
    background: %Q{
      Given I'm logged in as an administrator
      And I'm on the new user page
    }.strip,
  ),
  Feature.create(
    name: "Edit",
    category_id: category_users.id,
    description: %Q{
      In order to ensure that user permissions and details stay current
      As an administrator
      I want to edit a user
    }.strip,
    background: %Q{
      Given I'm logged in as an administrator
      And a user called Daniel exists
    }.strip,
  ),
  Feature.create(
    name: "List",
    category_id: category_users.id,
    description: %Q{
      In order to assign users to projects
      As an administrator
      I want to navigate available users
    }.strip,
    background: %Q{
      Given I'm logged in as an administrator
      And a user called Daniel exists
      And I'm on the users list page
    }.strip,
  ),
  Feature.create(
    name: "Profile",
    category_id: category_users.id,
    description: %Q{
      In order to keep my personal information updated
      As an authenticated user
      I want to manage my profile
    }.strip,
    background: %Q{
      Given I'm logged in as the user Daniel
      And I'm on the profile page
    }.strip,
  ),
  Feature.create(
    name: "Sign in",
    category_id: category_users.id,
    description: %Q{
      In order to get access to protected sections of the site
      As a visitor that has previously been assigned an account
      I should be able to sign in
    }.strip,
    background: %Q{}.strip,
  ),
  Feature.create(
    name: "Sign out",
    category_id: category_users.id,
    description: %Q{
      To protect my account from unauthorized access
      As a signed in user
      I should be able to sign out
    }.strip,
    background: %Q{}.strip,
  ),
]
category_users.features << users_features

projects_features = [
  Feature.create(name: "Create", category_id: category_projects.id),
  Feature.create(name: "Edit", category_id: category_projects.id),
  Feature.create(name: "List", category_id: category_projects.id),
]
category_projects.features << projects_features

categories_features = [
  Feature.create(name: "Create", category_id: category_categories.id),
  Feature.create(name: "Edit", category_id: category_categories.id),
  Feature.create(name: "List", category_id: category_categories.id),
]
category_categories.features << categories_features
