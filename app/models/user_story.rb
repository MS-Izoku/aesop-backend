class UserStory < ApplicationRecord
    belongs_to :user
    belongs_to :story
end

    #NOTES
    # As this class gets more complex, a new string column
    # may need to get added to show what the exact relationship a
    # user has to any given story
    #         ex: Writer , Editor , Reader , etc
    # profile type?
    # this is not an MVP feature, but it is something I'm thinking of
