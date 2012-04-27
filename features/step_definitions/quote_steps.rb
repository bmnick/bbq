require 'pp'

Given /^the following quote exists:$/ do |table|
  q = Quote.new
  
  q.text = table.rows_hash['Text']
  q.context = table.rows_hash["Context"]
  q.id = table.rows_hash['Number'].to_i if table.rows_hash.key?('Number')
  q.score = table.rows_hash['Score'].to_i if table.rows_hash.key?('Score')
  
  if table.rows_hash.key?('Tags')
    tags = table.rows_hash['Tags'].split(', ') 
  
    tags.each do |tag_name|
      tag = Tag.find_by_name(tag_name)
      q.tags << tag
    end
  end

  q.save!
end

Then /^I should see a score of "([^"]*)"$/ do |score|
  within '.score' do 
  	page.should have_content(score)
  end
end

When /^I search for "([^"]*)"$/ do |search|
  find(:css, "#search").set(search)
  click_button('search-submit')
end
