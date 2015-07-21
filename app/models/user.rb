class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  before_create :set_hashed_id

  def to_param
    self.hashed_id
  end

  def set_hashed_id
    self.hashed_id = SecureRandom.uuid.gsub('-','')
  end
end
