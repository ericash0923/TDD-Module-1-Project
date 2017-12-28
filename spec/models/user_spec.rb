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
  
  describe 'Employee details' do
    before do
      @employee = Employee.create(name: "Test", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf",
                                hours: 35, phone: 4545)
    end
    
    it 'Employment type Full or Part' do
      expect(@employee.position).to eq('Part-Time')
    end
    
    it 'Employee phone number' do
     expect(@employee.phone_number).to eq("718-555-#{@employee.phone}")
    end
  end
end
