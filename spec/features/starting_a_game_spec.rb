require 'spec_helper'

feature 'Starting a Game' do

  scenario 'Starting a New Game' do
    start_game
    expect(page).to have_content "Sorry, no one allowed on board without identification."
  end

  scenario 'Filling in name' do
    start_game
    fill_in 'player_name', with: 'Marko Ramius'
    click_link "Make Your Mark"
    name_value = find('input#player_name')['value']
    #make note of this awesomeness
    expect(page.find('#player_name')['value']).to eq 'Marko Ramius'
    expect(page.find("#player_name")['type']).to eq 'hidden'
  end


end

def start_game
  visit '/'
  click_link "New Game"
end