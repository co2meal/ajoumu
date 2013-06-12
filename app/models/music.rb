class Music < ActiveRecord::Base
  belongs_to :user

  attr_accessible :file, :content_type, :name, :artist, :category, :approved_at


  mount_uploader :file, MusicFileUploader


  validates_presence_of :user_id
  validates_presence_of :file

  validates_presence_of :category
  validates :category, :inclusion => { :in => %w(private public) }

  before_save :update_asset_attributes
  before_validation :fill_category

  private

  def update_asset_attributes
    if file.present? && file_changed?
      self.content_type = file.file.content_type
    end
  end

  def fill_category
    if self.user.is_user?
      self.category = "private"
    elsif
      self.user.is_copyrighter?
      self.category = "public"
    end
  end

end
