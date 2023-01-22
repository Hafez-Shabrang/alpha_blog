class Article < ApplicationRecord
  paginates_per 5
  belongs_to :user
  validates :title, presence: true, length: {minimum: 4, maximum: 20}
  validates :description, presence: true, length: {minimum: 5, maximum: 1000}
end
