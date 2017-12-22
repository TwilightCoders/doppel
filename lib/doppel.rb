require 'doppel/version'

require 'doppel/active_record/base'
require 'doppel/railtie' if defined?(Rails::Railtie)

module Doppel

  class << self
    attr_writer :logger

    def logger
      @logger ||= Logger.new($stdout).tap do |log|
        log.progname = self.name
        log.level = Logger::INFO
      end
    end
  end

  def self.root
    @root ||= Pathname.new(File.expand_path('../../', File.dirname(__FILE__)))
  end

  def self.load
    ::ActiveRecord::Base.send :prepend, ActiveRecord::Base
  end

end
