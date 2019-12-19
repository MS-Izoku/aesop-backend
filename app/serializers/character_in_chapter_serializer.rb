class CharacterInChapterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :character_id, :chapter_id
end
