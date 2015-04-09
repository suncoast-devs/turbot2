Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Turbot"

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  config.redis[:url] = ENV.fetch("REDISTOGO_URL", "redis://localhost")

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = ENV.fetch("LITA_ADAPTER", "shell")

  config.adapters.slack.token = ENV.fetch("SLACK_TOKEN", "")
end
