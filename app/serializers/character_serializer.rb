class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id , :name , :height , :weight , :biography , :personality
end
