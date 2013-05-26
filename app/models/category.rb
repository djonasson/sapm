class Category < ActiveRecord::Base
  acts_as_nested_set

  attr_accessible :name, :parent_id, :position
  attr_protected :lft, :rgt, :depth

  belongs_to :project

  validates :name, presence: true
  validates :position, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  #validate :parent_valid

  before_create :set_position

  def display_name
    name
  end

  def move_to_position(new_position)
    # TODO: Refactor - it shouldn't be necessary to make separate queries. Put up/down logic inside loop.
    moving_down = position < new_position
    if self.update_attribute(:position, new_position)
      Category.transaction do
        last_occupied = -1
        operator = moving_down ? :<= : :<
        siblings.where("position #{operator} ?", position).all.sort_by!(&:position).each do |cat|
          cat.update_attribute(:position, last_occupied + 1) if cat.position != last_occupied + 1
          last_occupied += 1
        end
        last_occupied = position
        operator = moving_down ? :> : :>=
        siblings.where("position #{operator} ?", position).all.sort_by!(&:position).each do |cat|
          cat.update_attribute(:position, last_occupied + 1) if cat.position != last_occupied + 1
          last_occupied += 1
        end
      end
      true
    else
      false
    end
  end

  private

  ##
  # We only allow a parent category that belongs to the same project.
  def parent_valid
    # TODO: Should we require the project to always be set for every category?
  end

  ##
  # Make sure that new categories are inserted last among their siblings.
  def set_position
    categories = project.nil? ? parent.children : project.categories
    self.position = categories.blank? ? 0 : (categories.map(&:position).max + 1)
  end
end
