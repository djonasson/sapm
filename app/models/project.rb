class Project < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  def display_name
    name
  end
end
