

config = Colony::Configuration.new

describe Colony::Configuration do
  it "should read configuration settings from colony.yaml" do
    config.message_thread_count.should eq 2
    config.broker.should eq 'localhost:9090'
  end

  it "should get the correct environment" do
    config.environment.should eq 'test'
  end
end
