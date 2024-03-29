Feature: Quote Score Management
  In order to find the funniest quotes
  As a user of BBQ
  I want to view quotes in various ways
  
  Scenario: See all links on the home page
    When I am on the home page
    Then I should see a link to "Recent"
    And I should see a link to "Top"
    And I should see a link to "Bottom"
    And I should see a link to "Browse"
    And I should see a link to "Random"

  Scenario: Go to the recent quotes page
    Given I am on the home page
    When I follow the link for "Recent"
    Then I should be on the recent quotes page
  
  Scenario: Go to the top quotes page
    Given I am on the home page
    When I follow the link for "Top"
    Then I should be on the top quotes page
  
  Scenario: Go to the bottom quotes page
    Given I am on the home page
    When I follow the link for "Bottom"
    Then I should be on the bottom quotes page
  
  Scenario: Go to the browse quotes page
    Given I am on the home page
    When I follow the link for "Browse"
    Then I should be on the quotes page
    
  Scenario: Go to the random quotes page
    Given I am on the home page
    When I follow the link for "Random"
    Then I should be on the random quotes page
  
  Scenario: Search for text works
    Given the following quote exists:
      | Text 		| Chowder: Ah Tits! |
      | Score 	| 242 |
      | Number	| 839 |
    When I am on the home page
    And I search for "tits"
    Then I should be on the search results page
    And I should see "Chowder: Ah Tits!"
