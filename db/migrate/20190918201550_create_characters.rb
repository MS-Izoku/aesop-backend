class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name , default: 'Character Name'
      t.integer :height, default: 100
      t.integer :weight, default: 150
      t.text :biography
      t.text :personality
      t.integer :story_id
      t.string :img_url , default: "https://cdn1us.denofgeek.com/sites/denofgeekus/files/styles/main_wide/public/2019/05/toy_story_4_duke_caboom_keanu_reeves.jpg?itok=adUMUrqP"
      t.timestamps
    end
  end
end
