class Service < ApplicationRecord
  belongs_to :user
  attr_accessible :provider, :uid, :uname, :uemail
end
