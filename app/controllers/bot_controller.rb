require "bot.rb"

class BotController < ApplicationController
  protect_from_forgery with: :null_session
  def hook
    notify_forecast
  end
end
