Feature: Placing a Ship
  In order to Have Ships on my Board
  As a Player
  I want to Place Ships

  Scenario: Placing the first ship
    Given I have entered my name
    When I click a square
    Then a ship should be placed there