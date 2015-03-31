require 'spec_helper'
require 'toy_robot_cli'

describe ToyRobotCli do

  describe "File mode" do
    before(:all) do
      instructions = ["PLACE 1,2,EAST", "MOVE", "MOVE", "NOTVALID", "LEFT", "MOVE", "PLACE 3,3,NORTH", "REPORT"]
      File.open("test.txt", "w+") do |f|
        f.puts(instructions)
      end
    end
    let(:file)   do
      ToyRobotCli::BotCli.start(["file","test.txt"])
    end

    it "shall return a position of the bot calculated from the instructions mentioned in the file" do
      results = capture(:stdout) { file }
      expect(results).to match(/3,3,NORTH/)
    end
    after(:all) do
      File.delete("test.txt")
    end
  end
end 
