class Project < ActiveRecord::Base
  attr_accessible :name, :category_ids

  has_and_belongs_to_many :users
  has_many :categories

  validates :name, presence: true

  def display_name
    name
  end

end
