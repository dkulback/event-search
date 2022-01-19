require 'rails_helper'

RSpec.describe 'root/index.html.erb', type: :view do
  it 'has a sign up form do' do
    visit root
    within '.new-user-form' do
    end
  end
end
