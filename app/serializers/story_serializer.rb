class StorySerializer
  include FastJsonapi::ObjectSerializer
  attributes(:title ,
     :high_concept , 
     :pitch , 
     :created_at , 
     :updated_at,
     #:chapters
  )
  has_many :chapters , serializer: ChapterSerializer
  has_many :characters
  belongs_to :user

  #cache_options enabled: true , cache_length: 1.hours
end