

describe Colony::Utils do
  it "should convert an integer to a log level" do
    Colony::Utils.get_log_level( 1 ).should eq  Logger::Severity::ERROR 
    Colony::Utils.get_log_level( 2 ).should eq Logger::Severity::WARN
    Colony::Utils.get_log_level( 3 ).should eq Logger::Severity::INFO
    Colony::Utils.get_log_level( 4 ).should eq Logger::Severity::DEBUG
  end

  it "should throw if a value out of range is passed in" do
    lambda{ Colony::Utils.get_log_level( 5 ) }.should raise_error Exception
    lambda{ Colony::Utils.get_log_level( 0 ) }.should raise_error Exception
  end
end
