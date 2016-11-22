class Service < ApplicationRecord
  belongs_to :user
  attr_accessor :provider, :uid, :uname, :uemail
end
