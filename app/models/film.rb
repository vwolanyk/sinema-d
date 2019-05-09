class Film < ApplicationRecord
  belongs_to :genre
  belongs_to :informant
  accepts_nested_attributes_for :genre, :informant
end
