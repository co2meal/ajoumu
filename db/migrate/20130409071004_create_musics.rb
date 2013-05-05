class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :file
      t.references :user

      t.timestamps
    end
  end
end
