class Category < ActiveRecord::Base
  acts_as_nested_set

  attr_accessible :name, :parent_id, :position
  attr_protected :lft, :rgt, :depth

  belongs_to :project

  validates :name, presence: true
  validates :position, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def display_name
    name
  end
end
