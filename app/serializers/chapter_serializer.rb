class ChapterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :story_id , :chapter_index,  :created_at , :updated_at , :body

  #belongs_to :story
  has_many :footnotes , serializer: FootnoteSerializer
  #has_many :characters
  #has_many :character_in_chapters
  #has_many :characters , through: :character_in_chapters
end
