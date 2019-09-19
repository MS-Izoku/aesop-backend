class CreateFootnotes < ActiveRecord::Migration[5.2]
  def change
    create_table :footnotes do |t|
      t.string :title
      t.string :body
      t.integer :chapter_id

      t.timestamps
    end
  end
end
