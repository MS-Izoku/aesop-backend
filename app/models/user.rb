class User < ApplicationRecord
    has_secure_password
    validates :username , uniqueness: { case_sensative: false}
    has_many :user_stories
    has_many :stories , through: :user_stories


end
