class Picture < ApplicationRecord
  has_many   :comments,   dependent: :destroy
  has_many   :likes,      dependent: :destroy
  belongs_to :category

  def next
    self.class.where("id > ?", id).first
  end

  def prev
    self.class.where("id < ?", id).last
  end

end
