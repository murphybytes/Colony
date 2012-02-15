require 'ffi-rzmq'
require 'logger'
require 'trollop'
require 'colony/utils'

opts = Trollop::options do 
  opt :router_port, "Port for message senders", :default => 9090
  opt :dealer_port, "Port for message receivers", :default => 9091
  opt :log_level, "Logging verbosity. 1 = least verbose, 4 = most verbose", :default => 4 
end

logger = Logger.new( STDOUT )
logger.level = Colony::Utils.get_log_level( opts[:log_level] )
logger.info "Broker started. Outbound port is #{opts[:dealer_port]}. Inbound port is #{opts[:router_port]}"

context = ZMQ::Context.new
frontend = context.socket(ZMQ::ROUTER)
backend = context.socket(ZMQ::DEALER)

frontend.bind("tcp://*:#{ opts[:router_port] }")
backend.bind("tcp://*:#{ opts[:dealer_port] }")

poller = ZMQ::Poller.new
poller.register(frontend, ZMQ::POLLIN)
poller.register(backend, ZMQ::POLLIN)

loop do
  poller.poll(:blocking)
  poller.readables.each do |socket|
    if socket === frontend
      loop do
        socket.recv_string(message = '')
        more = socket.more_parts?
        backend.send_string(message, more ? ZMQ::SNDMORE : 0)
        break unless more
      end
    elsif socket === backend
      loop do
        socket.recv_string(message = '')
        more = socket.more_parts?
        frontend.send_string(message, more ? ZMQ::SNDMORE : 0)
        break unless more
      end
     end
  end
end
