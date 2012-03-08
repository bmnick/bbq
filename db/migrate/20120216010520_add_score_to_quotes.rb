class AddScoreToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :score, :integer
  end
end
