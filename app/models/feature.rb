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


  private

  ##
  # Make sure that new features are inserted last among their siblings.
  def set_position
    features = category.features
    self.position = features.blank? ? 0 : (features.map(&:position).max + 1)
  end

end
