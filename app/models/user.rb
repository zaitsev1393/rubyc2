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
         :omniauth_providers => [:facebook, :twitter]

  has_many :comments, dependent: :destroy
  has_many :likes,    dependent: :destroy
  has_many :events,   dependent: :destroy    
  has_many :services, dependent: :destroy


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      if auth.provider == 'twitter'
        user.name  = auth.info.name
        user.email = "#{auth.info.name}@example.com" 
      end
      user.email    = auth.info.email if auth.provider == 'facebook' 
      user.password = Devise.friendly_token[0,20]
    end
  end

end
