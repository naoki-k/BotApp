class Bot

  def greet
    url = YAML.load_file('config/slack.yml')['bot']
    slack_client(url).ping('なんだい？')
  end

  def slack_client(url)
    Slack::Notifier.new(url)
  end
end
