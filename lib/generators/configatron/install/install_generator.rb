require 'rails/generators/base'

class Configatron
  class InstallGenerator < ::Rails::Generators::Base #:nodoc:
    desc 'Generates configatron files for the default Rails environments.'

    def self.source_root
      @_configatron_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
    end

    def self.banner
      "rails generate configatron:install"
    end

    def copy_files
      template 'initializers/configatron.rb', 'config/initializers/configatron.rb'
    end
  end
end