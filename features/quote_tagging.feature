Feature: Quote Tagging Support
  In order to clarify quotes
  As a member of a real-life community
  I want to be able to tag quotes
  
  Scenario: Have tag link
    When I am on the home page
    Then I should see a link to "Tags"
  
  Scenario: Go to link page
    Given I am on the home page
    When I follow the link for "Tags"
    Then I should be on the tags page

  Scenario: See that tags exist
    Given the following tag exists:
      | Name | out of context |
    And the following tag exists:
      | Name | after 6pm |
    When I go to the tags page
    Then I should see "out of context"
    And I should see "after 6pm"
  