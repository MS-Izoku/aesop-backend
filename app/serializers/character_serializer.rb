class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name , :height , :weight , :biography , :personality , :story_id , :appearance , :img_url
end
