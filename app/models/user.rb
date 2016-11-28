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
  has_many :services, dependent: :destroy

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
