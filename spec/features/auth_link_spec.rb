require 'rails_helper'

describe 'Auth for users' do
  before do 
    visit root_path
  end
  
  it 'has links to register and sign in, logout' do
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Register")
    expect(page).to have_content("Logout")
  end
  
  it 'custom link for Sign In' do
    expect(find_link('Sign In')[:href]).to eq('/login')
  end
  
  it 'custom link for Register' do
    expect(find_link('Register')[:href]).to eq('/register')
  end
  
  it 'user can register' do
    click_link('Register')
    fill_in 'user[name]', with: 'John Smith'
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'asdfasdf')
    fill_in('Password confirmation', with: 'asdfasdf')
    
    expect { click_button('Sign up') }.to change(User, :count).by(1)
  end
  
  it 'user can login' do
    user = User.create( name: "test", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf" )
    click_link("Sign In")
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'asdfasdf')
    click_button('Log in')
    
    expect(page).to have_content("Signed in successfully.")
  end
    
end

