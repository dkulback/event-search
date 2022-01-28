require 'rails_helper'
RSpec.describe 'Bible Search' do
  describe 'happy path' do
    it 'allows user to search bible verses'  do
    user = User.create!(login: 'darren', email: 'dkulback@gmail.com', password: '123451234512345123451234512345123451234512345123451234512345')
    response = File.read('spec/fixtures/passage.json')
    stub_request(:get, "https://bible-api.com/John3:16?translation=kjv").to_return(status: 200, body: response)

    visit user_path(user)

    within '.apis' do
      click_link 'Search For Bible Passages'
    end

     within '.search-bible' do
       fill_in :search_book, with: 'John'
       fill_in :search_chapter, with: '3'
       fill_in :search_verse, with: '16'
       click_button 'Search'
       expect(page.status_code).to eq 200
     end
     within '.bible' do
        expect(page).to have_content('Reference John 3:16 Passage For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.')
     end
   end
 end
end



