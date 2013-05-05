class CreateMusicPlayHistories < ActiveRecord::Migration
  def change
    create_table :music_play_histories do |t|
      t.references :music

      t.timestamps
    end
    add_index :music_play_histories, :music_id
  end
end
