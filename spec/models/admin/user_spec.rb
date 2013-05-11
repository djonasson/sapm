require 'spec_helper'

module Admin
  describe User do
    should { validate_presence_of(:email) }
    should { validate_presence_of(:name) }
    should { validate_presence_of(:administrator) }
  end
end
