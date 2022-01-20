require 'rails_helper'

RSpec.describe 'users/new.html.erb', type: :view do
  it 'has a form to register a user' do
    visit root_path
    save_and_open_page
    within '.new-user' do
    end
  end
end
