class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :omniauthable, :registerable
  devise :database_authenticatable, :confirmable, :recoverable, :rememberable,
    :trackable, :validatable, :timeoutable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation,
    :remember_me, :project_ids

  has_and_belongs_to_many :projects

  before_destroy :ensure_not_administrator

  def display_name
    name.blank? ? email : name
  end

  def administrator?
    administrator
  end

  # Set the password without knowing the current password used in our
  # confirmation controller.
  def attempt_set_password(params)
    update_attributes({
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    })
  end

  # Return whether a password has been set
  def has_no_password?
    encrypted_password.blank?
  end

  # Provide access to protected method unless_confirmed
  def only_if_unconfirmed
    pending_any_confirmation { yield }
  end


  protected

  def password_required?
    # Password is required if it is being set, but not for new records
    if persisted?
      password.present? || password_confirmation.present?
    else
      false
    end
  end

  def ensure_not_administrator
    if administrator?
      errors.add(:base, "Can't destroy an administrator.")
      false
    end
  end

end
