require 'zmq'
require 'logger'


module Colony

  class Context
    attr_reader :zmq

    def self.instance 
      return @@context if defined? @@context 
      @@context = Context.new
      @@context
    end

    def set_options opts = {}
      @log = opts[:logger] if opts.key?(:logger)
      @io_thread_count = opts.key?(:io_thread_count) ? opts[:io_thread_count] : 1    
    end

    def initialize_zmq
      unless @zmq
        @zmq = ZMQ::Context.new( @io_thread_count )
      end
    end

    def terminate_zmq
      @zmq.close() if @zmq
    end

    private
    def initialize
      @log = Logger.new(STDOUT)
      @io_thread_count = 1
      @zmq = nil
    end
  end



end


