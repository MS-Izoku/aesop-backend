class AddCurrentChapterAndStoryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_story_id, :integer
    add_column :users, :current_chapter_id, :integer
  end
end
