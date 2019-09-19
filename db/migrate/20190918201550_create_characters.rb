class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name , default: 'Character Name'
      t.integer :height, default: 100
      t.integer :weight, default: 150
      t.text :biography
      t.text :personality
      t.integer :story_id
      t.timestamps
    end
  end
end
