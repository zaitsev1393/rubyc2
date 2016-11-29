class NewDevise::RegistrationsController < Devise::RegistrationsController

  def create
    super
    p @user.email
    UserMailer.welcome_email(@user).deliver_now if @user.save
  end

end