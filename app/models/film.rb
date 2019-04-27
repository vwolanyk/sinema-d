class Film < ApplicationRecord
  belongs_to :genre
  belongs_to :informant
end
