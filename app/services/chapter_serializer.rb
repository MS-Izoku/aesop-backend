class ChapterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id , :title,  :body
end
