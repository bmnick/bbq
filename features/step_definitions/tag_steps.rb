require 'pp'

Given /^the following tag exists:$/ do |table|
  t = Tag.new
  t.name = table.rows_hash['Name']
  
  t.save!
end

When /^I add the tag "([^\"]*)"$/ do |tag|
  field_value = find_field('quote_tag_tokens').value
  
  if field_value = '[]'
    cur_ids = []
  else
    cur_ids = field_value.split(',') 
  end
  
  new_tag = Tag.find_by_name(tag)
  cur_ids << new_tag.id
  
  fill_in('quote_tag_tokens', with: cur_ids.join(','))
end