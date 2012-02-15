require 'logger'



module Colony


  class Utils
  
    def self.get_log_level( intval )
      severity = case intval
                 when 1 then Logger::Severity::ERROR
                 when 2 then Logger::Severity::WARN
                 when 3 then Logger::Severity::INFO
                 when 4 then Logger::Severity::DEBUG
                 else raise Exception.new "#{intval} must be in range [1,4]"
                 end
     
      
    end
  end

end
