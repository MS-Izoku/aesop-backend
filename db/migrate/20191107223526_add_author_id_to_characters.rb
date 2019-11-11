class AddAuthorIdToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :author_id, :integer
  end
end
