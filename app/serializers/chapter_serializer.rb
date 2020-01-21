# frozen_string_literal: true

class ChapterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :story_id, :chapter_index, :created_at, :updated_at, :body
  has_many :footnotes, serializer: FootnoteSerializer
end
