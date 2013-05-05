class Music < ActiveRecord::Base
  attr_accessible :file, :user, :content_type, :name, :artist

  mount_uploader :file, MusicFileUploader

  # validates_presence_of :user_id
  validates_presence_of :file

  before_save :update_asset_attributes

  private

  def update_asset_attributes
    if file.present? && file_changed?
      self.content_type = file.file.content_type
    end
  end
end
