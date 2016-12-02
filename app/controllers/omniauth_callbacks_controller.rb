class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    social
  end

  def vkontakte
    social
  end

  def twitter
    social
  end
  
private

  def social
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

end
