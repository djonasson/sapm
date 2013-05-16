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

project = Project.create(name: "Test Project")

administrator.projects << project
developer.projects << project


# =============================================================================
# Categories
# =============================================================================

categories = [
  category_1 = Category.create(name: "Category 1"),
  category_2 = Category.create(name: "Category 2"),
  category_3 = Category.create(name: "Category 3"),
  category_4 = Category.create(name: "Category 4"),
  category_5 = Category.create(name: "Category 5"),
  category_6 = Category.create(name: "Category 6"),
]

sub_categories_1 = [
  sub_category_1 = Category.create(name: "Sub Category 1"),
  sub_category_2 = Category.create(name: "Sub Category 2"),
  sub_category_3 = Category.create(name: "Sub Category 3"),
]

sub_categories_2 = [
  sub_category_4 = Category.create(name: "Sub Category 1"),
  sub_category_5 = Category.create(name: "Sub Category 2"),
  sub_category_6 = Category.create(name: "Sub Category 3"),
]

category_2.children = sub_categories_1
category_6.children = sub_categories_2
project.categories << categories
