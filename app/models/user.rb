class User < ApplicationRecord
  include Gravtastic
  gravtastic
  before_save {self.email = email.downcase}
  paginates_per 5
  has_many :articles
  # VALID_EMAIL_REGEX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
  validates :username, presence: true, length: {minimum: 3, maximum: 20}, uniqueness: true
  validates :email, presence: true, length: {minimum: 15, maximum: 40}
  has_secure_password
end
