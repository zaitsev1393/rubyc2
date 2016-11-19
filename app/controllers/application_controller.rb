class ApplicationController < ActionController::Base
  before_action :write_event

  protect_from_forgery with: :exception

  def write_event
    # @user = User.find(current_user.id)
    # @event = Event.new
    # @event = @user.events.create
    # @event.name = request.referer
    # @event.save
    # p @event
    # p @user.events
  end
end
