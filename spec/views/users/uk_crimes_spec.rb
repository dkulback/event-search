require 'rails_helper'

RSpec.describe 'stock list' do
  it 'lists the current stock data at any given time' do
    user = User.create!(login: 'bill', email: 'bill@gmail.com', password: '12345')
    response = File.read('spec/fixtures/crimes.json')
    stub_request(:get, 'https://data.police.uk/api/crimes-no-location?category=all-crime&force=leicestershire').to_return(
      status: 200, body: response
    )
    visit user_crimes_path(user)

    within '.crimes' do
      expect(page.status_code).to eq(200)
      expect(page).to have_content('violent-crime')
      expect(page).to have_content('2021-11')
      expect(page).to have_content('shoplifting')
    end
  end
end
