require 'yaml'

module Colony
  class Configuration
    attr_reader :message_threads

    def initialize
      @yaml = YAML.load_file( 'conf/colony.yaml' )[environment]
      @message_threads = @yaml['message-thread-count']
    end

    private
    def environment
      ENV['COLONY_ENV'] ? ENV['COLONY_ENV'] : 'development'
    end
  end
end
