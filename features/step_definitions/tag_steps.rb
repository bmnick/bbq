require 'pp'

Given /^the following tag exists:$/ do |table|
  t = Tag.new
  t.name = table.rows_hash['Name']
  
  t.save!
end