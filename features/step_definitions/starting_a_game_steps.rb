Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I click 'New Game'$/) do
  click_link('New Game')
end

Then(/^I should see "(.*?)"$/) do |message|
  # !! ** !!
  # Whoops, this test will always pass!
  expect(message).to eq "Your name please?"
end

# Is there some sort of describe '' do for
# scenarios?

Given(/^I have entered my name$/) do
  pending
end

When(/^I click 'Enter Battle'$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the Board\.$/) do
  pending # express the regexp above with the code you wish you had
end
