class Post < ApplicationRecord
  validates :text,length: { in: 1..140 }
end
