class FootnoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :body, :chapter_id
end
