require 'zmq'


module Colony
  module Node


    module ClassMethods
      def role name
        @@role = name 
      end

      def role_name
        @@role
      end

      def talks_to other_role
        @@talks_to[other_role] = nil
      end
      
      #
      # names of other roles to listen for messages from
      #
      def listeners
        @@talks_to
      end
      
      # supply name of method to handle messages from other 
      # nodes, takes one argument (the message)
      #  
      def on_message_call handler
        @@handler_symbol = handler
      end
      
      # supply name of main program method
      def run_program_with runner
        @@runner_symbol = runner
      end


      def handler
        @@handler_symbol
      end

      def self.handler_
        @@handler_symbol
      end

      def self.runner_
        @@runner_symbol 
      end

      def self.role_
        @@role
      end

      def self.extended( base )
        @@handler_symbol = nil unless defined? @@handler_symbol
        @@talks_to = {} unless defined? @@talks_to
        @@role = nil unless defined? @@role
        @@sender_symbol = nil unless defined? @@sender_symbol
      end

    end

    def run
      message_handler = method( ClassMethods.handler_ )
      raise "Wrong number of arguments for #{ClassMethods.handler_}. Expecting 1" unless message_handler.arity == 1

      heartbeat_generator
      heartbeat_listener
      message_listener
      message_sender

      message_handler.call 'zip'
    end
    
    
    def heartbeat_generator
    end

    def heartbeat_listener
    end

    def message_listener
      if ClassMethods.handler_ 
        message_handler = method( ClassMethods.handler_ )
        #todo handle tcp messages 
        message = ''
        message_handler.call message
      end
      
    end

    def runner
      if ClassMethods.runner_
        runner_method = method( ClassMethods.runner_ )
        runner_method.call
      end
    end

    def self.included( base )
      base.send :extend, ClassMethods
    end

    
  end

end
