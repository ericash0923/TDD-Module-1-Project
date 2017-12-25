require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user can be created' do
    user = User.create(name: "Test", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
    expect(user).to be_valid
  end
  
  it "cannot be created without name or email" do
    user = User.create(name: "Test", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
    user.name = nil
    user.email = nil
    expect(user).to_not be_valid
  end
  
  it 'Employee can be created' do
    user = Employee.create(name: "Test", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
    expect(user).to be_valid
  end
end
