require 'spec_helper'

describe StatRaptor::Error do
  context "#initialize" do
    it "returns an instance of StatRaptor::Error" do
      StatRaptor::Error.new("message").should be_a(StatRaptor::Error)
    end

    it "is a subclass of StandardError" do
      StatRaptor::Error.superclass.should == StandardError
    end
  end
end
