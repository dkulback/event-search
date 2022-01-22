require 'rails_helper'

RSpec.describe 'links to sing up  or login' do
  it 'has a link to sign in' do
    visit root_path

    click_link 'Sign in'
    expect(current_path).to eq(login_path)

    visit root_path

    click_link 'Sign Up'
    expect(current_path).to eq(new_user_path)
  end
end
