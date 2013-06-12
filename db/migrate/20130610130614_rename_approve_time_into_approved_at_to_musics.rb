class RenameApproveTimeIntoApprovedAtToMusics < ActiveRecord::Migration
  def change
    rename_column :musics, :approved_time, :approved_at
  end
end
