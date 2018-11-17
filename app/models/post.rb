class Post < ApplicationRecord
  validates :text,length: { in: 1..140 }
  mount_uploader :image, ImageUploader
  belongs_to :user
end
