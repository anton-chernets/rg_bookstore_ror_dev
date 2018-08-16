require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { Faker.create :user }
end
