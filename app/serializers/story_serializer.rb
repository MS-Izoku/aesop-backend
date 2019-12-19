# frozen_string_literal: true

class StorySerializer
  include FastJsonapi::ObjectSerializer
  attributes(:title,
             :high_concept,
             :pitch,
             :created_at,
             :updated_at)
  has_many :chapters, serializer: ChapterSerializer
  has_many :characters, serializer: CharacterSerializer
end
