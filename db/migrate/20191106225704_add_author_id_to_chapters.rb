class AddAuthorIdToChapters < ActiveRecord::Migration[5.2]
  def change
    add_column :chapters, :author_id, :integer
  end
end
