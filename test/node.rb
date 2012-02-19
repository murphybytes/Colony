$: << File.join( Dir.pwd, '..', 'lib' )

require 'colony'

class Node
  include Colony::ZMQ::Req


end


Node.new
