module TagCloudHelper
  
  def tag_cloud_for collection, sort_method, display_property
    pp collection
    pp sort_method
    pp display_property
    
    sorted = collection.sort_by &sort_method
    
    scores = score_array sorted
    
    collection.map do |tag|
      tag_output_for(tag, scores[tag.id], display_property)
    end.join(" ")
  end
  
  def tag_output_for tag, score, display_property
    puts "Sending #{display_property} to type #{tag.class}: #{tag}"
    link_to tag.send(display_property), tag, class: "tag-cloud-#{score+1}"
  end
  
  def score_array sorted_array
    chunks = chunk_array sorted_array, 6
    
    scores = {}
    
    chunks.each_with_index do |chunk, score|
      chunk.each do |tag|
        scores[tag.id] = score
      end
    end
    
    scores
  end
  
  def chunk_array array, num_chunks
    width = (array.length / num_chunks) + 1
    
    array.each_slice(width).to_a
  end
end