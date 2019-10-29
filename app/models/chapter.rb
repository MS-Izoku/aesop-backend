class Chapter < ApplicationRecord
    belongs_to :story
    has_many :footnotes
    has_many :character_in_chapters
    has_many :characters , through: :character_in_chapters
end
