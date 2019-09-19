class CreateCharacterInChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :character_in_chapters do |t|
      t.integer :character_id
      t.integer :chapter_id

      t.timestamps
    end
  end
end
