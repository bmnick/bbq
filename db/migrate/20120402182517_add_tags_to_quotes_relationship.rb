class AddTagsToQuotesRelationship < ActiveRecord::Migration
  def change
    create_table :quotes_tags, id: false do |t|
      t.references :tag
      t.references :quote
    end
    
    add_index :quotes_tags, [:quote_id, :tag_id]
    add_index :quotes_tags, [:tag_id, :quote_id]
  end
end
