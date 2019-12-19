# frozen_string_literal: true

class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes(:username,
             :password_digest,
             :email,
             :avatar_url,
             :bio,
             :current_chapter_id,
             :current_story_id,
             :current_character_id
            )
end
