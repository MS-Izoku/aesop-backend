# frozen_string_literal: true

class UserStorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :role
end
