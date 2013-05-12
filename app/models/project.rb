class Project < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :users

  validates :name, presence: true

  def display_name
    name
  end

  def to_param
    "#{id}-#{display_name.parameterize}"
  end
end
