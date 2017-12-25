require 'rails_helper'

describe 'Auth for users' do
  it 'has links to register and sign in if a user is not logged in' do
    visit root_path
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Register")
  end
  
  it 'user can register' do
    visit root_path
    click_link('Register')
    fill_in 'user[name]', with: 'John Smith'
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'asdfasdf')
    fill_in('Password confirmation', with: 'asdfasdf')
    
    expect { click_button('Sign up') }.to change(User, :count).by(1)
  end
  
  it 'user can login' do
    user = User.create( name: "test", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf" )
    login_as(user)
  end
    
end

