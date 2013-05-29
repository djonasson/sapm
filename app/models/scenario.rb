class Scenario < ActiveRecord::Base
  attr_accessible :description, :feature_id, :name, :position

  belongs_to :feature

  validates :name, presence: true
  validates :position, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_create :set_position

  def display_name
    name
  end

  # ##
  # # Move the feature to a new position within the category.
  # def move_to_position(new_position)
  #   new_position ||= position
  #   new_position = new_position.to_i
  #   # TODO: Refactor - it shouldn't be necessary to make separate queries. Put up/down logic inside loop.
  #   moving_down = position < new_position
  #   if self.update_attribute(:position, new_position)
  #     Feature.transaction do
  #       last_occupied = -1
  #       operator = moving_down ? :<= : :<
  #       category.features.where("position #{operator} ?", position).order(:position).select { |f| f != self }.each do |ft|
  #         ft.update_attribute(:position, last_occupied + 1) if ft.position != last_occupied + 1
  #         last_occupied += 1
  #       end
  #       last_occupied = position
  #       operator = moving_down ? :> : :>=
  #       category.features.where("position #{operator} ?", position).order(:position).select { |f| f != self }.each do |ft|
  #         ft.update_attribute(:position, last_occupied + 1) if ft.position != last_occupied + 1
  #         last_occupied += 1
  #       end
  #     end
  #     true
  #   else
  #     false
  #   end
  # end

  private

  ##
  # Make sure that new scenarios are inserted last among their siblings.
  def set_position
    scenarios = feature.scenarios
    self.position = scenarios.blank? ? 0 : (scenarios.map(&:position).max + 1)
  end
end
