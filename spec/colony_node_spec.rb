$: << File.join( Dir.pwd, 'lib' )

require 'colony'


class ColonyNodeMock
  include Colony::Node
  role 'MockNode'
  
end




describe ColonyNodeMock do
  it "should have a role" do
    node = ColonyNodeMock.new
    node.role.should == "MockNode" 
  end
  
end
