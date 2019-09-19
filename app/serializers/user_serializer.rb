class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :password_digest

  # has_many :user_stories
  # has_many :stories , through: :user_stories
end
