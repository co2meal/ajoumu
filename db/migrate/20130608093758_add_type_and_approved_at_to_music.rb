class AddTypeAndApprovedAtToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :type, :string
    add_column :musics, :approved_time, :datetime
  end
end
