# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensative: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :user_stories
  has_many :stories, through: :user_stories
end
