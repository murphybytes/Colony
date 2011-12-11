
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

      def on_message_call handler
        @@handler_symbol = handler
      end


      def handler
        @@handler_symbol
      end

      def self.handler_
        @@handler_symbol
      end

      def self.role_
        @@role
      end

      def self.extended( base )
        @@handler_symbol = nil unless defined? @@handler_symbol
        @@talks_to = {} unless defined? @@talks_to
        @@role = nil unless defined? @@role
      end

    end

    def run
      message_handler = method( ClassMethods.handler_ )
      raise "Wrong number of arguments for #{ClassMethods.handler_}. Expecting 1" unless message_handler.arity == 1
      message_handler.call 'zip'
    end



    def self.included( base )
      base.send :extend, ClassMethods
    end

    
  end

end
