require 'rails_helper'

RSpec.describe 'user show page' do
  it 'has a link to certain apis' do
    user = User.create!(login: 'bill', email: 'bill@gmail.com', password: '12345')
    visit user_path(user)

    within '.apis' do
      click_link 'Check Stocks'

      expect(current_path).to eq(user_stocks_path(user))
    end
  end
end
