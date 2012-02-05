Feature: Quote CRUD management
	In order to share funny quotes
	As a member of a real-life community
	I want to be able to save those quotes

	Scenario: Create a quote
		Given I am on the create quote page
		When I fill in the following:
			| Text		| Ben: I want OMG WTF and BBQ running! |
			| Context 	| SSE server |
		And I press "Submit Quote"
		Then I should see "Quote submitted"
		And I should be on the recent quotes page