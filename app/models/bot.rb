class Bot
  enum characters: { mickey: "mickey", minnie: "minnie", pooh: "pooh", ariel: "ariel" }

  def greet
    character = YAML.load_file('config/slack.yml')['mickey']
    slack_client(character: character).ping('なんだい？')
  end

  # 引数を受け取ってキャラを生成するようにする
  def slack_client(character: mickey)
    Slack::Notifier.new(:character)
  end
end
