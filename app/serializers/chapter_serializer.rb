class ChapterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title,  :body , :created_at , :updated_at

  #belongs_to :story
  #has_many :footnotes
  #has_many :characters
  #has_many :character_in_chapters
  #has_many :characters , through: :character_in_chapters
end
