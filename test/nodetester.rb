
require 'colony'
require 'trollop'

opts = Trollop::options do
  opt :role_name, "Name of role", :type => :string, :default => "test"
end

class NodeTester
  include Colony::Node
  
  role 'NodeTester'
  run_program_with :runner
  
  def initialize
    puts "role = #{ self.role }"
    log.level = Logger::DEBUG
    log.debug "started"
  end


  def runner
    log.debug "run loop started"
  end
end






n = NodeTester.new
n.run
