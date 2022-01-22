require 'rails_helper'

RSpec.describe 'stock list' do
  it 'lists the current stock data at any given time' do
    user = User.create!(login: 'bill', email: 'bill@gmail.com', password: '12345')
    response = File.read('spec/fixtures/stocks.json')
    stub_request(:get, 'https://dashboard.nbshare.io/api/v1/apps/reddit').to_return(status: 200, body: response)
    visit user_stocks_path(user)

    within '.stocks' do
      expect(page.status_code).to eq(200)
      expect(page).to have_content('TSLA')
      expect(page).to have_content('GME')
      expect(page).to have_content('NFLX')
    end
  end
end
