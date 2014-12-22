class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string        :title
      t.string        :photographer
      t.text          :caption
      t.text          :image
      t.timestamps
    end
  end
end