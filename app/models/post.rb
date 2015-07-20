class Post < ActiveRecord::Base
  belongs_to :user

  scope :published, -> {where(published: 1)}
end
