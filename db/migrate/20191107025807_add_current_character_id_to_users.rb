class AddCurrentCharacterIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_character_id, :integer
  end
end
