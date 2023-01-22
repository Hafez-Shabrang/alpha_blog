class Article < ApplicationRecord
  paginates_per 5
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: {minimum: 4, maximum: 20}
  validates :description, presence: true, length: {minimum: 5, maximum: 1000}
end
