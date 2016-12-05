class ApplicationController < ActionController::Base
  before_action :write_event
  before_action :authenticate_user!
  before_action :set_locale

  protect_from_forgery with: :exception

  # Turned off to not fill the db with events records

  def write_event
    # @user = User.find(current_user.id)
    # @event = Event.new
    # @event = @user.events.create
    # @event.name = request.referer
    # @event.save
    # p @event
    # p @user.events
  end

private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

end
