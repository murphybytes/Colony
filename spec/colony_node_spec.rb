$: << File.join( Dir.pwd, 'lib' )

require 'colony'

class ColonyNodeMock
  include Colony::Node
  role 'MockNode'
  
end


describe ColonyNodeMock do
  it "#role_name defaults to class name" do
    
   ColonyNodeMock.role_name.should == "MockNode" 
  end
end
