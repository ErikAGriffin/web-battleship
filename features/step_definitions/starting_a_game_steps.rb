Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I click 'New Game'$/) do
  click_link('New Game')
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(message).to eq "Your name please?"
end
