Feature: Starting a Game
  In order to Play Battleship
  As a Captain
  I want to Start a Game

  Scenario: Signing Up
    Given I am on the homepage
    When I click 'New Game'
    Then I should see "Your name please?"

  Scenario: I've Signed Up
    Given I have entered my name
    When I click 'Enter Battle'
    Then I should see the Board.
