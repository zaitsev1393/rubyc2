class Comment < ApplicationRecord
  validates :user, presence: true
  validates :picture, presence: true

  belongs_to :user
  belongs_to :picture
end
