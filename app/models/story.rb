# frozen_string_literal: true

class Story < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :chapters
  has_many :characters
  has_many :user_stories
  has_many :users, through: :user_stories

  def create_ownership
    UserStory.create(user_id: owner.id, story_id: id)
    Story.find_by(user_id: id).update(user_id: id)
  end
end
