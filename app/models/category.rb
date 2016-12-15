# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  
  has_many :pictures

  has_many :cat_fols
  has_many :users, through: :cat_fols


end
