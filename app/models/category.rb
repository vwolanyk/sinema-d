class Category < Tag
  has_many :film_categories
  has_many :films, through: :film_categories
end
