class Category < ActiveRecord::Base
  acts_as_nested_set

  attr_accessible :name, :parent_id, :position
  attr_protected :lft, :rgt, :depth

  belongs_to :project

  validates :name, presence: true
  validates :position, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validate :parent_valid

  before_create :set_position

  def display_name
    name
  end


  private

  ##
  # We only allow a parent category that belongs to the same project.
  def parent_valid
    # TODO:
  end

  ##
  # Make sure that new categories are inserted last among their siblings.
  def set_position
    categories = project.nil? ? parent.children : project.categories
    self.position = categories.blank? ? 0 : (categories.map(&:position).max + 1)
  end
end
