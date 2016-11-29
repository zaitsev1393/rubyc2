class UserMailer < ApplicationMailer
  default from: "catsnboobs@example.com"

  def welcome_email(user)
    @user = user
    @url = "http://catsnboobs.com"
    mail(to: @user.email, subject: "Welcome to Cats n Boobs")
  end

  def image_added(user, image)
    @user = user
    @picture = image
    mail(to: @user.email, subject: "New image added!")
  end
  
end
