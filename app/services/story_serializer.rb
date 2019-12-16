class StorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title , :high_concept , :owner , :pitch , :created_at , :updated_at
  has_many :chapters
  has_many :characters
end