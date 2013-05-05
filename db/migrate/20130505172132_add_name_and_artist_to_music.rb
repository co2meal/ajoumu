class AddNameAndArtistToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :name, :string
    add_column :musics, :artist, :string
  end
end
