require 'rails_helper'

feature 'User creates an idea' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Think Square')

    click_on('Create Idea')
  end
end
