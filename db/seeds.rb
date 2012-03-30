# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Quote.create([{text: "Chowder: Ah Tits!", score: 9000},
               {text: "Ben: BROOMBALL!", score: 50},
               {text: "TO: Process!", score: 1},
               {text: "Todd: insanity", context: "It's todd", score: 40},
               {text: "Randy: projects!", score: -30},
               {text: "Andy: Let's do review sessions!", score: 13},
               {text: "Justin: Oh, Doug, did you get your cord?", score: -3389},
               {text: "jbkojkljkl", score: 32},
               {text: "Becca: George broke stuff then left!", score: 57}])