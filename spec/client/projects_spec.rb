require 'spec_helper'

describe StatRaptor::Client::Projects do
  context "#create_project" do
    it "returns the project json on success"
    it "raises and exception if the project was not created"
  end

  context "#delete_project" do
    it "returns true on success"
    it "raises an exception if the project was not deleted"
  end
end
