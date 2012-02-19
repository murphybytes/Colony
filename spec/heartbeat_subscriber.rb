require 'ffi-rzmq'

module Colony
  module HeartbeatSubscriber
    context = ZMQ::Context.new( 1 )
    socket = context.socket( ZMQ::SUB )
    socket.connect( "epgm://192.168.1.1:9999" )
    while true
      message = ''
      socket.recv_string( message )
      puts message
    end
  end
end
