class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :title , default: 'Chapter Title'
      t.text :body , default: 'Body Text Goes Here'
      t.integer :story_id
      t.integer :chapter_index
      t.timestamps
    end
  end
end
