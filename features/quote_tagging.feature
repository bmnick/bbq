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
    
  Scenario: Create a new tag
    Given I am on the new tag page
    When I fill in the following:
      | Name | Something Something Something Dark Side |
    And I press "Create Tag"
    Then I should be on the tags page
    And I should see "Something Something Something Dark Side"
    
  Scenario: Add a tag to a new quote
    Given the following tag exists:
      | Name | sleepy |
    When I am on the new quote page
    And I fill in the following:
      | Text | Dobson: We don't have to whisper |
      | Context | Heist preparations |
    And I add the tag "sleepy"
    And I press "Submit Quote"
    Then I should be on the quotes page
    And I should see "sleepy"
    
  Scenario: View quotes for a tag
    Given the following tag exists:
      | Name | bros |
    And the following quote exists:
      | Text | Doug: hey bro! |
      | Tags | bros |
    When I am on the tags page
    And I follow the link for "bros"
    Then I should be on the tag page for "bros"
    And I should see "Doug: hey bro!"
  