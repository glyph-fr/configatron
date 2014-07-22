require 'configatron'
require 'redis'

Configatron.configure do |config|
  config.redis = case Rails.env.to_sym
    when :development then Redis.new
    when :test then Redis.new
    else Redis.new(url: ENV['REDIS_URL'])
  end
end

Configatron::Integrations::Rails.init
