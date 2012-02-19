require 'colony'

module Colony
  module ZMQ
    module Context


      def self.included( base ) 
        unless defined? @@context
          configuration = Configuration.new
          @@context = ::ZMQ::Context.new( configuration.message_thread_count )
        end
      end

      def self.context
        @@context
      end

    end
  end
end
