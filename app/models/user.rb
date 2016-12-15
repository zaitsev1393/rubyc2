# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  events                 :string           default([]), is an Array
#  last_sign_out_at       :datetime
#  name                   :string
#  provider               :string
#  uid                    :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  admin                  :boolean
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         :omniauth_providers => [:facebook, :twitter, :vkontakte]

  has_many :comments, dependent: :destroy
  has_many :likes,    dependent: :destroy
  has_many :events,   dependent: :destroy    

  has_many :cat_fols
  has_many :categories, through: :cat_fols

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      
      if auth.provider != 'facebook'
        user.name   = auth.info.name
        user.email  = "#{auth.info.name}@example.com" 
      else
        user.email  = auth.info.email 
      end
      
      user.password = Devise.friendly_token[0,20]
    end
  end

end
