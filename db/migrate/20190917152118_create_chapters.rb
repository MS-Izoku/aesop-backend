class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :title , default: 'Title'
      t.text :body , default: ''
      t.integer :story_id
      t.integer :chapter_index
      t.timestamps
    end
  end
end
