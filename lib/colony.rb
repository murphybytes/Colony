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
        @@role = nil unless defined? @@role
        @@sender_symbol = nil unless defined? @@sender_symbol
      end

    end

    def run

      start_heartbeat_listener
      start_message_listener

    end
    
    def role
      return ClassMethods.role_ if ClassMethods.role_
      self.name
    end


    def start_heartbeat_listener
    end

    def start_message_listener
      if ClassMethods.handler_ 
        raise "Wrong number of arguments for #{ClassMethods.handler_}. Expecting 1" unless message_handler.arity == 1
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


