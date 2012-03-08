require 'pp'

Given /^the following quote exists:$/ do |table|
  q = Quote.new
  
  q.text = table.rows_hash['Text']
  q.context = table.rows_hash["Context"]
  q.id = table.rows_hash['Number'].to_i if table.rows_hash.key?('Number')
  q.score = table.rows_hash['Score'].to_i if table.rows_hash.key?('Score')

  q.save!
end