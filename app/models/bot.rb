class Bot
  enum characters: { mickey: "mickey", minnie: "minnie", pooh: "pooh", ariel: "ariel" }
  
  character = YAML.load_file('config/slack.yml')['mickey']

  def greet
    slack_client.ping('なんだい？')
  end

  # 引数を受け取ってキャラを生成するようにする
  def slack_client
    Slack::Notifier.new(MICKEY)
  end
end