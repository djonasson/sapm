class Feature < ActiveRecord::Base
  attr_accessible :background, :category_id, :description, :name, :position

  belongs_to :category

  validates :name, presence: true
  validates :position, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_create :set_position

  def display_name
    name
  end

  ##
  # Move the feature to a new position within the category.
  def move_to_position(new_position)
    new_position ||= position
    new_position = new_position.to_i
    # TODO: Refactor - it shouldn't be necessary to make separate queries. Put up/down logic inside loop.
    moving_down = position < new_position
    if self.update_attribute(:position, new_position)
      Feature.transaction do
        last_occupied = -1
        operator = moving_down ? :<= : :<
        category.features.where("position #{operator} ?", position).order(:position).select { |f| f != self }.each do |ft|
          ft.update_attribute(:position, last_occupied + 1) if ft.position != last_occupied + 1
          last_occupied += 1
        end
        last_occupied = position
        operator = moving_down ? :> : :>=
        category.features.where("position #{operator} ?", position).order(:position).select { |f| f != self }.each do |ft|
          ft.update_attribute(:position, last_occupied + 1) if ft.position != last_occupied + 1
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
  # Make sure that new features are inserted last among their siblings.
  def set_position
    features = category.features
    self.position = features.blank? ? 0 : (features.map(&:position).max + 1)
  end

end
