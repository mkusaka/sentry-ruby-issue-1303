Sentry.init do |config|
  config.send_default_pii = true
  config.debug = true
  # config.before_send = lambda do |event, hint|
  #   binding.irb
  #   event
  # end
end
