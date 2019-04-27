class CreateFilmsAndTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :type
      t.text :name
      t.boolean :active, default:true
      t.timestamps null: false
    end


    create_table :films do |t|
      t.string :title
      t.text :note
      t.references :genre, index: true
      t.references :informant, index: true
      t.date :last_watched, null: true

      t.timestamps null: false
    end
  end
end
