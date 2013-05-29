class String
  def clean
    strip.gsub(/\n\s*/, "\n")
  end
end

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
  users_confirmation = Feature.create(
    name: "Confirmation",
    category_id: category_users.id,
    description: %Q{
      In order to get access to protected sections of the site
      As a visitor that has been assigned an account
      I should be able to confirm my e-mail address
    }.clean,
    background: %Q{
      Given I exist as a user
      And My account has not been confirmed
      And I'm on the activate account page
    }.clean
  ),
  users_create = Feature.create(
    name: "Create",
    category_id: category_users.id,
    description: %Q{
      In order to assign people to projects
      As an administrator
      I want to create a new user
    }.clean,
    background: %Q{
      Given I'm logged in as an administrator
      And I'm on the new user page
    }.clean
  ),
  users_edit = Feature.create(
    name: "Edit",
    category_id: category_users.id,
    description: %Q{
      In order to ensure that user permissions and details stay current
      As an administrator
      I want to edit a user
    }.clean,
    background: %Q{
      Given I'm logged in as an administrator
      And a user called Daniel exists
    }.clean
  ),
  users_list = Feature.create(
    name: "List",
    category_id: category_users.id,
    description: %Q{
      In order to assign users to projects
      As an administrator
      I want to navigate available users
    }.clean,
    background: %Q{
      Given I'm logged in as an administrator
      And a user called Daniel exists
      And I'm on the users list page
    }.clean
  ),
  users_profile = Feature.create(
    name: "Profile",
    category_id: category_users.id,
    description: %Q{
      In order to keep my personal information updated
      As an authenticated user
      I want to manage my profile
    }.clean,
    background: %Q{
      Given I'm logged in as the user Daniel
      And I'm on the profile page
    }.clean
  ),
  users_create = Feature.create(
    name: "Sign in",
    category_id: category_users.id,
    description: %Q{
      In order to get access to protected sections of the site
      As a visitor that has previously been assigned an account
      I should be able to sign in
    }.clean,
    background: %Q{}.clean
  ),
  users_sign_in = Feature.create(
    name: "Sign in",
    category_id: category_users.id,
    description: %Q{
      In order to get access to protected sections of the site
      As a visitor that has previously been assigned an account
      I should be able to sign in
    }.clean,
    background: %Q{}.clean
  ),
  users_sign_out = Feature.create(
    name: "Sign out",
    category_id: category_users.id,
    description: %Q{
      To protect my account from unauthorized access
      As a signed in user
      I should be able to sign out
    }.clean,
    background: %Q{}.clean
  ),
]
category_users.features << users_features


users_confirmation_scenarios = [
  Scenario.create(
    feature_id: users_confirmation.id,
    name: "Successfully confirms account",
    description: %{
      When I choose a valid password
      Then I should see an account confirmed message
      And I should be signed in
    }.clean
  ),
  Scenario.create(
    feature_id: users_confirmation.id,
    name: "No password",
    description: %{
      When I give no password
      Then I see a password can't be blank message
      And I should be signed out
    }.clean
  ),
  Scenario.create(
    feature_id: users_confirmation.id,
    name: "No password confirmation",
    description: %{
      When I give no password confirmation
      Then I see a passwords don't match message
      And I should be signed out
    }.clean
  ),
  Scenario.create(
    feature_id: users_confirmation.id,
    name: "Password mismatch",
    description: %{
      When I give non-matching password and password confirmation
      Then I see a passwords don't match message
      And I should be signed out
    }.clean
  ),
]
users_confirmation.scenarios << users_confirmation_scenarios

users_create_scenarios = [
  Scenario.create(
    feature_id: users_create.id,
    name: "Valid data",
    description: %{
      When I enter valid user data
      Then I should see a successful user creation message
      And I should be on the edit page for the newly created user
      And a confirmation e-mail should have been sent to the user
    }.clean
  ),
  Scenario.create(
    feature_id: users_create.id,
    name: "Invalid e-mail",
    description: %{
      When I enter an invalid e-mail
      Then I should see an invalid e-mail message
    }.clean
  ),
  Scenario.create(
    feature_id: users_create.id,
    name: "No e-mail",
    description: %{
      When I forget to enter an e-mail
      Then I should see an e-mail required message
    }.clean
  ),
]
users_create.scenarios << users_create_scenarios

users_edit_scenarios = [
  Scenario.create(
    feature_id: users_edit.id,
    name: "Valid data",
    description: %{
      When I edit Daniel with valid data
      Then I should see a successful user updated message
      And I should be on the edit page for Daniel
    }.clean
  ),
  Scenario.create(
    feature_id: users_edit.id,
    name: "Invalid e-mail",
    description: %{
      When I edit Daniel with an invalid e-mail
      Then I should see an invalid e-mail message
    }.clean
  ),
  Scenario.create(
    feature_id: users_edit.id,
    name: "No e-mail",
    description: %{
      When I edit Daniel forgetting an e-mail
      Then I should see an e-mail required message
    }.clean
  ),
  Scenario.create(
    feature_id: users_edit.id,
    name: "E-mail changed",
    description: %{
      When I edit Daniel changing e-mail
      Then I should see a successful user updated message
      And I should be on the edit page for Daniel
      And a confirmation e-mail should have been sent to Daniel
    }.clean
  ),
  Scenario.create(
    feature_id: users_edit.id,
    name: "Password can only be managed by the owner",
    description: %{
      When I go to the edit page for Daniel
      Then I should not see a password field
      And I should not see a password confirmation field
    }.clean
  ),
]
users_edit.scenarios << users_edit_scenarios

users_list_scenarios = [
  Scenario.create(
    feature_id: users_list.id,
    name: "User's details in list",
    description: %{
      Then I should see the name of the user Daniel
      And I should see the e-mail of the user Daniel
    }.clean
  ),
]
users_list.scenarios << users_list_scenarios

users_profile_scenarios = [
  Scenario.create(
    feature_id: users_profile.id,
    name: "Personal details visible",
    description: %{
      Then I should see the name of the user Daniel
      And I should see the e-mail of the user Daniel
    }.clean
  ),
]
users_profile.scenarios << users_profile_scenarios

users_sign_in_scenarios = [
  Scenario.create(
    feature_id: users_sign_in.id,
    name: "Signs in successfully",
    description: %{
      Given I exist as a user
      And My account has been confirmed
      And I am not logged in
      When I sign in with valid credentials
      Then I see a successful sign in message
      When I return to the site
      Then I should be signed in
    }.clean
  ),
  Scenario.create(
    feature_id: users_sign_in.id,
    name: "Doesn't exist",
    description: %{
      Given I do not exist as a user
      When I sign in with valid credentials
      Then I see an invalid login message
      And I should be signed out
    }.clean
  ),
  Scenario.create(
    feature_id: users_sign_in.id,
    name: "Tries to sign in before confirming the e-mail",
    description: %{
      Given I exist as a user
      And My account has not been confirmed
      When I sign in with valid credentials
      Then I should see an unconfirmed account message
      And I should be signed out
    }.clean
  ),
  Scenario.create(
    feature_id: users_sign_in.id,
    name: "No e-mail",
    description: %{
      Given I exist as a user
      And My account has been confirmed
      And I am not logged in
      When I sign in with no e-mail
      Then I see a missing e-mail message
      And I should be signed out
    }.clean
  ),
  Scenario.create(
    feature_id: users_sign_in.id,
    name: "No password",
    description: %{
      Given I exist as a user
      And My account has been confirmed
      And I am not logged in
      When I sign in with no password
      Then I see a missing password message
      And I should be signed out
    }.clean
  ),
  Scenario.create(
    feature_id: users_sign_in.id,
    name: "Wrong password",
    description: %{
      Given I exist as a user
      And My account has been confirmed
      And I am not logged in
      When I sign in with a wrong password
      Then I see an invalid login message
      And I should be signed out
    }.clean
  ),
]
users_sign_in.scenarios << users_sign_in_scenarios

users_sign_out_scenarios = [
  Scenario.create(
    feature_id: users_sign_out.id,
    name: "User signs out",
    description: %{
      Given I am logged in
      When I sign out
      Then I should see a signed out message
      When I return to the site
      Then I should be signed out
    }.clean
  ),
]
users_sign_out.scenarios << users_sign_out_scenarios


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
