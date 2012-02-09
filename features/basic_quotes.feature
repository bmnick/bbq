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

	Scenario: See Recent quotes
		Given the following quote exists:
			| Text		| Ben: I want OMG WTF and BBQ running! |
			| Context	| SSE server |
		And the following quote exists:
			| Text		| Cody: I like 5 guys in my mouth! |
			| Context	| none! |
		When I am on the recent quotes page
		Then I should see "Ben: I want OMG WTF and BBQ running!"
		And I should see "SSE server"
		And I should see "Cody: I like 5 guys in my mouth!"
		And I should see "none!"
	
	@wip
	Scenario: See a single quote
		Given the following quote exists:
			| Text		| Ben: I want OMG WTF and BBQ running! |
			| Context 	| SSE Server |
			| Number	| 42 |
		When I am on the recent quotes page
		And I follow the link for "Quote #42"
		Then I should be on the quote page for quote 42
		And I should see "Ben: I want OMG WTF and BBQ running!"
		And I should see "SSE Server"
		And show me the page
