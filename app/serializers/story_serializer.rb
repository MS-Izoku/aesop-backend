class StorySerializer
  include FastJsonapi::ObjectSerializer
  attributes(:title ,
     :high_concept , 
     :pitch , 
     :created_at , 
     :updated_at,
     #sd:chapters
  )
  has_many :chapters
  has_many :characters
  belongs_to :user
end