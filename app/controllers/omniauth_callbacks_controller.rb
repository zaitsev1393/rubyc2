class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    #render :text => request.env['omniauth.auth'].to_yaml
    sign_in_and_redirect @user
  end

  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])
    #render :text => request.env['omniauth.auth'].to_yaml
    sign_in_and_redirect @user
    p @user
  end

  def vkontakte
    @user = User.from_omniauth(request.env["omniauth.auth"])
    #render :text => request.env['omniauth.auth'].to_yaml
    sign_in_and_redirect @user
    p @user
  end
  
end
