class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale
  before_action :load_categories
  protect_from_forgery with: :null_session
  # before_action :write_event
  
  # Turned off to not fill the db with events records

  # def write_event
  #   if current_user
  #     @event = current_user.events.create 
  #     @event.name = request.referer
  #     @event.save
  #   end
  # end

private

  def load_categories
    @categories ||= Category.all
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

end
