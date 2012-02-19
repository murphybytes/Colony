

config = Colony::Configuration.new

describe Colony::Configuration do
  it "should read configuration settings from colony.yaml" do
    config.message_threads.should eq 2
  end
end
