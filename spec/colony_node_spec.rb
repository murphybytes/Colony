$: << File.join( Dir.pwd, 'lib' )

require 'colony'

class ColonyNodeMock
  include Colony::Node
  role 'MockNode'
  talks_to 'remote_1'
  talks_to 'remote_2'
  
  
  
end


describe ColonyNodeMock do
  it "#role_name defaults to class name" do
    
   ColonyNodeMock.role_name.should == "MockNode" 
  end

  it "#listeners should have elements" do 
    ColonyNodeMock.listeners.size.should == 2
    ColonyNodeMock.listeners.key?('remote_1').should == true
    ColonyNodeMock.listeners.key?('remote_2').should == true
  end
end
