require 'spec_helper'

feature 'The Homepage' do

  scenario 'Seeing the Page for the First Time' do
    visit '/'
    expect(page).to have_content 'New Game'
    expect(page).to have_content 'Load Game'
  end

end