class CreateFootnotes < ActiveRecord::Migration[5.2]
  def change
    create_table :footnotes do |t|
      t.string :title , default: ""
      t.string :body , default: ""
      t.integer :chapter_id

      t.timestamps
    end
  end
end
