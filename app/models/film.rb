class Film < ApplicationRecord
  belongs_to :genre
  belongs_to :informant
  has_many :film_categories
  has_many :categories, through: :film_categories
  accepts_nested_attributes_for :genre, :informant, :film_categories
end
