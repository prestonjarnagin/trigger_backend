require 'rails_helper'

RSpec.describe 'Visiting /' do
  it 'displays a welcome message' do
    visit '/'
    expect(page).to have_content("Documentation for this website can be found at")
  end
end
