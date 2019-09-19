class User < ApplicationRecord
    has_secure_password
    validates :username , uniqueness: true , length:{ in: 6..20 }
    validates :email  , confirmation: true #uniqueness: true
    # validates :email_confirmation , confirmation: true

    has_many :user_stories
    has_many :stories , through: :user_stories

    def validate_email # validate the email and email_confirmation
        # check to see if they match
        # then check to see if they're unique
    end

    def validate_password_on_create # how should I implement this?
        # check to see if password has certain criteria
        # min 1 symbol , 1 uppercase letter
    end
end
