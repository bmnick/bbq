Feature: Quote Score Management
	In order to find the funniest quotes
	As a user of BBQ
	I want to be able to score those quotes

	Scenario: See the score
		Given the following quote exists:
			| Text 		| Dobson: Derp Derp Derp |
			| Context	| most days |
			| Score 	| 242 |
			| Number	| 7 |
		When I am on the quote page for quote 7
		Then I should see "242"
		And I should see "upvote"
		And I should see "downvote"