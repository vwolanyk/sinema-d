class AddFilmCategoriesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :film_categories do |t|
      t.references :film, index: true
      t.references :category, index: true
      t.timestamps null: false
    end
  end
end
