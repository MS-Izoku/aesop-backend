class Character < ApplicationRecord
    belongs_to :story
    has_many :character_in_chapters
    has_many :chapters , through: :character_in_chapters
end
