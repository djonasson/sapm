require 'spec_helper'

module Admin
  describe User do
    it { should validate_presence_of(:email) }
  end
end
