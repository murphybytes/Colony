$: << File.join( Dir.pwd, 'lib' )
require 'colony'

describe Colony::MessageChannel do
  
  it 'should retrieve list of nodes with a particular role' do
    message_channel = Colony::MessageChannel.new
    message_channel.nodes( :dummy_role ).count should eq( 5 )
  end
end
