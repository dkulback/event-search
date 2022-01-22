require 'rails_helper'

RSpec.describe 'login form' do
  it 'logs in with valid credentials' do
    User.create!(login: 'dkulback', email: 'dkulback@gmail.com', password: '12345')
    visit root_path
    click_link 'Sign in'

    within '.login-form' do
      fill_in 'login', with: 'dkulback'
      fill_in 'password', with: '12345'
      click_on 'Log In'

      user = User.first
      expect(current_path).to eq(user_path(user))
    end
    within '.success' do
      user = User.first
      expect(page).to have_content("Welcome #{user.login}!")
    end
  end
  it 'wont login in with BAD credentials' do
    User.create!(login: 'dkulback', email: 'dkulback@gmail.com', password: '12345')
    visit root_path

    click_link 'Sign in'

    expect(current_path).to eq(login_path)
    within '.login-form' do
      fill_in 'login', with: 'dkulback'
      fill_in 'password', with: '123456'
      click_on 'Log In'
    end
    within '.error' do
      expect(page).to have_content('invalid password or username')
    end
  end
  it 'can log out a user' do
    User.create!(login: 'dkulback', email: 'dkulback@gmail.com', password: '12345')
    visit root_path
    click_link 'Sign in'

    within '.login-form' do
      fill_in 'login', with: 'dkulback'
      fill_in 'password', with: '12345'
      click_on 'Log In'

      user = User.first
      expect(current_path).to eq(user_path(user))
    end

    click_button 'log out'
    expect(page).to have_content('You are now logged out!')
  end
end
