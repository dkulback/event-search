require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:login).case_insensitive }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:login) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }
end
