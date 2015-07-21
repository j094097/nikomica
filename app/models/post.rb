class Post < ActiveRecord::Base  
  belongs_to :user

  scope :published, -> {where(published: 1)}

  before_create :set_hashed_id

  def to_param
    self.hashed_id
  end

  def set_hashed_id
    self.hashed_id = SecureRandom.uuid.gsub('-','')
  end
end
