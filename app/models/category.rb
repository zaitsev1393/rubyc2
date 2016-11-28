class Category < ApplicationRecord
  
  has_many :pictures

  has_many :cat_fols
  has_many :users, through: :cat_fols


end
