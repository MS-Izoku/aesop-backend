class Story < ApplicationRecord    
    belongs_to :owner , class_name: 'User' , foreign_key: 'user_id'
    has_many :chapters
    has_many :characters
    has_many :user_stories
    has_many :users, through: :user_stories

    def create_ownership
        UserStory.create(user_id: self.owner.id , story_id: self.id)
        Story.find_by(user_id: self.id).update(user_id: self.id)
    end
    
end
