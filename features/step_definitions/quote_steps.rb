Given /^the following quote exists:$/ do |table|
  q = Quote.new
  
  q.text = table.rows_hash['Text']
  q.context = table.rows_hash["Context"]

  q.save
end