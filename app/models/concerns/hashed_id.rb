module HashId
  extend ActiveSupport::Concern

  included do
    before_create :set_hashed_id
  end

  def to_param
    self.hashed_id
  end

  def set_hashed_id
    self.hashed_id = SecureRandom.uuid.gsub('-','')
  end
end