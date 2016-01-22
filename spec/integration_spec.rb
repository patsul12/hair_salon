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

  scenario 'allows a user to go to the stylists page to see their info' do
    visit '/'
    fill_in 'name', with: 'Alex'
    click_button 'Add Stylist'
    click_link 'Alex'
    expect(page).to have_content('Alex')
  end
end

feature 'add a client path' do
  scenario 'allows a user to add a client to a stylist' do
    visit '/'
    fill_in 'name', with: 'Alex'
    click_button 'Add Stylist'
    click_link 'Alex'
    fill_in 'client_name', with: 'Adam'
    click_button 'Add Client'
    expect(page).to have_content('Adam')
  end
end
