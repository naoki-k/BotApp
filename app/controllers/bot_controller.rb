# require "bot.rb"

class BotController < ApplicationController
  protect_from_forgery with: :null_session
  
  def hook
    greet
  end

  def greet
    url = YAML.load_file('config/slack.yml')['bot']
    characters = ["mickey", "minnie", "pooh", "ariel"]
    character = characters[rand(4)]
    set_locale(character.to_sym)
    slack_client(url).ping t('global.greet.hello'), icon_url: icon_url(character.to_sym), username: character
  end

  def slack_client(url)
    Slack::Notifier.new url
  end

  def icon_url(character)
    icon_urls = {
      mickey: "https://lumiere-a.akamaihd.net/v1/images/ct_mickeymouseandfriends_mickey_ddt-16970_4e99445d.jpeg?region=0,0,600,600&width=480" ,
      minnie: "https://lumiere-a.akamaihd.net/v1/images/ct_mickeymouseandfriends_minnie_ddt-16970_3_4a2aa999.jpeg?region=0,0,600,600&width=480",
      pooh: "https://www.disney.co.jp/content/dam/disney/characters/disney_d_pixar/winnie_the_pooh/new_art/Pooh_FC_thumbnail.jpg",
      ariel: "https://lumiere-a.akamaihd.net/v1/images/tmb-sq_character-ariel_launch_95971bf8.jpeg?width=480"
    }
    icon_urls[character]
  end
end
