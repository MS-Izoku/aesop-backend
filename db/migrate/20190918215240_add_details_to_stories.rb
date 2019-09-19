class AddDetailsToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :high_concept, :text
    add_column :stories, :pitch, :string
  end
end
