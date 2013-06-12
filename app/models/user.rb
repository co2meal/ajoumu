class User < ActiveRecord::Base

  has_many :payment_histories

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :credit
  attr_accessible :category

  validates_presence_of :category
  validates :category, :inclusion => { :in => ["User", "Copyright holder"] }
  validates :credit, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0}


  # attr_accessible :title, :body

  def is_user?
    self.category == "User"
  end

  def is_copyrighter?
    self.category == "Copyright holder"
  end

  def visible_musics
    Music.where("user_id = ? OR (category = 'public' AND approved_at IS NOT NULL)", self.id)
  end

  def increment_credit(amount)
  end
end
