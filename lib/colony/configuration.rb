require 'yaml'

module Colony
  class Configuration
    attr :environment

    def initialize
      @environment = ENV['COLONY_ENV'] ? ENV['COLONY_ENV'] : 'development'
      @yaml = YAML.load_file( 'conf/colony.yaml' )[environment]
    end


    def method_missing( symbol, *args, &block )
      key = symbol.to_s.gsub('_', '-' )
      @yaml[key]
    end



  end
end
