# == Schema Information
#
# Table name: pictures
#
#  id          :integer          not null, primary key
#  url         :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  likes_count :integer          default(0)
#  image       :string
#

class Picture < ApplicationRecord
  has_many   :comments,   dependent: :destroy
  has_many   :likes,      dependent: :destroy
  belongs_to :category

  mount_uploader :image, ImageUploader

  def next
    self.class.where("id > ?", id).first
  end

  def prev
    self.class.where("id < ?", id).last
  end

end
