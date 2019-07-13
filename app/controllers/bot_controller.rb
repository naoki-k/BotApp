# require "bot.rb"

class BotController < ApplicationController
  protect_from_forgery with: :null_session
  
  def hook
    greet
  end

  def greet
    url = YAML.load_file('config/slack.yml')['bot']
    charactors = ["mickey", "minnie"]
    charactor = charactors[rand(2)]
    slack_client(url).ping 'なんだい？', icon_url: icon_url(charactor.to_sym), username: charactor
  end

  def slack_client(url)
    Slack::Notifier.new url
  end

  def icon_url(charactor)
    icon_urls = {
      mickey: "https://lumiere-a.akamaihd.net/v1/images/ct_mickeymouseandfriends_mickey_ddt-16970_4e99445d.jpeg?region=0,0,600,600&width=480" ,
      minnie: "https://lumiere-a.akamaihd.net/v1/images/ct_mickeymouseandfriends_minnie_ddt-16970_3_4a2aa999.jpeg?region=0,0,600,600&width=480"
    }
    icon_urls[charactor]
  end
end
