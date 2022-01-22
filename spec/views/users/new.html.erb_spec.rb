require 'rails_helper'

RSpec.describe 'users/new.html.erb', type: :view do
  it 'has a form to register a user' do
    visit new_user_path

    within '.new-user' do
      fill_in 'user_email', with: 'dkulback@gmail.com'
      fill_in 'user_login', with: 'dkulback'
      fill_in 'user_password', with: '12345'
      click_on 'Create User'

      user = User.first
      expect(current_path).to eq(user_path(user))
    end
    user = User.first
    within '.success' do
      expect(page).to have_content("Welcome #{user.login}!")
    end
  end
  it 'has a flash message with errors of the user' do
    user = User.create!(email: 'dkulback@gmail.com', login: 'pee pee and poop', password: '1234')
    visit new_user_path

    within '.new-user' do
      fill_in 'user_email', with: 'dkulback@gmail.com'
      fill_in 'user_login', with: 'dkulback'
      fill_in 'user_password', with: '12345'
      click_on 'Create User'

      user = User.first
      expect(current_path).to eq(users_path)
    end
    user = User.first
    within '.failure' do
      expect(page).to have_content('["Email has already been taken"]')
    end
  end
end
