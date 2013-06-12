class RenameTypeIntoCategoryFromMusicsAndUsers < ActiveRecord::Migration
  def change
    rename_column :musics, :type, :category
    rename_column :users, :type, :category
  end
end
