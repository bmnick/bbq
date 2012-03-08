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
		Then I should see a score of "242"
		And I should see a link to "upvote"
		And I should see a link to "downvote"

	@wip
	Scenario: Upvote should increase the score
		Given the following quote exists:
			| Text		| Ben: RUBY! |
			| Score 	| 41 |
			| Number 	| 89 |
		When I am on the quote page for quote 89
		And I follow the link for "upvote"
		Then I should be on the quote page for quote 89
		And I should see a score of "42"