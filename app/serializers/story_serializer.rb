class StorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id , :title

  has_many :chapters
  belongs_to :user
end
