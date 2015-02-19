Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I click 'New Game'$/) do
  click_link('New Game')
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(page).to have_content message
end

Given(/^I have entered my name$/) do
  visit('/newgame')
  fill_in('name', with: 'Marko')
end

When(/^I click "(.*?)"$/) do |submit|
  click_button(submit)
end

Then(/^I should see the Board\.$/) do
  pending # express the regexp above with the code you wish you had
end
