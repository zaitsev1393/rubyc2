# == Schema Information
#
# Table name: likes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  picture_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  picture_url :string
#

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :picture, :counter_cache => true
end
