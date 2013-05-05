class MusicPlayHistory < ActiveRecord::Base
  belongs_to :music
  # attr_accessible :title, :body
end
