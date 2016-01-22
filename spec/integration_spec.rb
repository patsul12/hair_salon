require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

feature 'add a stylist path' do
  scenario 'allows a user to add a stylist to the page' do
    visit '/'
    fill_in 'name', with: 'Franz'
    click_button 'Add Stylist'
    expect(page).to have_content('Franz')
  end
end
