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
  category_users      = Category.create(name: "Users"),
  category_projects   = Category.create(name: "Projects"),
  category_categories = Category.create(name: "Categories"),
]

sub_categories_user = [
  Category.create(name: "Confirmation"),
  Category.create(name: "Create"),
  Category.create(name: "Edit"),
  Category.create(name: "List"),
  Category.create(name: "Profile"),
  Category.create(name: "Sign in"),
  Category.create(name: "Sign out"),
]
category_users.children = sub_categories_user

sub_categories_projects = [
  Category.create(name: "Create"),
  Category.create(name: "Edit"),
  Category.create(name: "List"),
]
category_projects.children = sub_categories_projects

sub_categories_categories = [
  Category.create(name: "Create"),
]
category_categories.children = sub_categories_categories

project.categories << categories
