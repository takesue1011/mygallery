class AddPhotographerToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photographer, :string
  end
end
