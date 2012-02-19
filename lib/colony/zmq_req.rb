require 'colony'

module Colony
  module ZMQ
    module Req
      include Colony::ZMQ::Context

      def self.included base
        configuration = Configuration.new 
        @socket = @@context.socket( ::ZMQ::REQ )
        @socket.connect( configuration.broker )
      end

      def send message 
        @socket.send_string( message )
        response = ''
        @socket.recv_string( response )
        response
      end

    end
  end
end
