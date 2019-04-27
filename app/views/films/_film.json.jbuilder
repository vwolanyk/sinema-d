json.extract! film, :id, :title, :note, :genre_id, :informant_id, :last_watched, :created_at, :updated_at
json.url film_url(film, format: :json)
