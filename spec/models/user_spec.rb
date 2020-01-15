require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    it {should validate_uniqueness_of :email}
  end
end
