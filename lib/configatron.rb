require 'configatron/version'

require 'configatron/deep_clone'
require 'configatron/errors'
require 'configatron/integrations'
require 'configatron/root_store'
require 'configatron/store'

# Proc *must* load before dynamic/delayed, or else Configatron::Proc
# will refer to the global ::Proc
require 'configatron/proc'
require 'configatron/delayed'
require 'configatron/dynamic'

class Configatron
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config)
  end

  class Configuration
    attr_accessor :redis

    def initialize
      @redis = ''
    end
  end
end

# NO_EXT gets defined when you require "configatron/core", which
# signals that you don't want any extensions. It'd be nice to have a
# better internal signaling mechanism (could use environment
# variables, but then they become part of the public interface).
unless defined?(Configatron::NO_EXT)
  require 'configatron/ext/kernel'
end
