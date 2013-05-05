class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :omniauthable, :registerable
  devise :database_authenticatable, :confirmable, :recoverable, :rememberable,
    :trackable, :validatable, :timeoutable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation,
    :remember_me


  def display_name
    name.blank? ? email : name
  end

  def administrator?
    true
  end
end
