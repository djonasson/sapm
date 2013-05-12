require 'spec_helper'

module Admin
  describe User do
  it { should have_and_belong_to_many(:projects) }
    it { should validate_presence_of(:email) }
  end
end
