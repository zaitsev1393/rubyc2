class NewDevise::SessionsController < Devise::SessionsController

  def destroy
    @user = User.find(current_user.id)
    @user.last_sign_out_at = Time.now
    @user.save
    super
  end

end