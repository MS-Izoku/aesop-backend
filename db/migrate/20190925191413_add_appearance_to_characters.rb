class AddAppearanceToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :appearance, :text
  end
end
