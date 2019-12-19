class UserStorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :role
end
