require 'spec_helper'

feature 'Starting a Game' do

  scenario 'Starting a New Game' do
    start_game
    expect(page).to have_content "Sorry, no one allowed on board without identification."
  end

  scenario 'Filling in name' do
    prepare_game
    expect(page).to have_content("Apologies Captain, one can't be too careful these days.");
    expect(page).to have_content("Where should we position your Aircraft Carrier?");
  end

  scenario 'Preparing your ships' do
    prepare_ships
  end


end

def start_game
  visit '/'
  click_link "New Game"
end

def prepare_game
  start_game
  fill_in 'player_name', with: 'Marko Ramius'
  click_button "Make Your Mark"
end

def prepare_ships
  prepare_game

end
