Feature: I want to demonstrate what an automation framework looks like in operation
  Background:
    Given the anonymous library screen is displayed
    When I sign in
    Then I should be on the user library screen

  @demo
  Scenario Outline: Navigating through the app
    Given I touch the shop icon
    Then I should see the shop page
    Given I search for <shopitem>
    Then I should be presented with results
    Then I go back
    Then I go back
    Then I should be back on the user library screen
    Given I open the first book
    And move <fpages> foward
    And move <fpages> backward
    Then I go back
    Then I should be back on the user library screen

Examples:
  |shopitem|fpages|
  |"Robots"| 10   |
