require 'toy_robot'
describe "check toy robot commands" do
  LEFT ||= -1
  RIGHT ||= 1
  describe "if bot is placed facing NORTH direction" do
    before(:each) do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","3","2","NORTH"
    end
    it "places bot at 3,2 co-ordinates and faces NORTH " do
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("NORTH")
    end

    it "it should move the bot in the NORTH direction by 1 step " do
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("3")
      expect(@toy_robot.direction).to eq("NORTH")
    end

    it "should turn left by 90 degrees to west and the postion should be the same" do  
      @toy_robot.turn LEFT
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("WEST")
    end

    it "should turn right by 90 degrees to east and the postion should be the same" do
      @toy_robot.turn RIGHT
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("EAST")
    end

    it "should report position of the bot" do
      expect(@toy_robot.report).to eq("3,2,NORTH")
    end
  end


  describe "if bot is placed facing SOUTH direction" do
    before(:each) do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","3","2","SOUTH"
    end
    it "places bot at 3,2 co-ordinates and faces south " do
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("SOUTH")
    end

    it "it should move the bot in the SOUTH direction by 1 step " do
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("1")
      expect(@toy_robot.direction).to eq("SOUTH")
    end

    it "should turn left by 90 degrees to east and the postion should be the same" do 
      @toy_robot.turn LEFT
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("EAST")
    end

    it "should turn right by 90 degrees to west and the postion should be the same" do
      @toy_robot.turn RIGHT
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("WEST")
    end

    it "should report position of the bot" do
      expect(@toy_robot.report).to eq("3,2,SOUTH")
    end
  end



  describe "if bot is placed facing WEST direction" do
    before(:each) do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","3","2","WEST"
    end
    it "places bot at 3,2 co-ordinates and faces west " do
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("WEST")
    end

    it "it should move the bot in the WEST direction by 1 step " do
      t=ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("2")
      #expect(t.instance_variable_get(:@x)).to eql("2")
      #assigns(:x).should_not be_nil
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("WEST")
    end

    it "should turn left by 90 degrees to SOUTH and the postion should be the same" do 
      @toy_robot.turn LEFT
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("SOUTH")
    end

    it "should turn right by 90 degrees to NORTH and the postion should be the same" do
      @toy_robot.turn RIGHT
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("NORTH")
    end

    it "should report position of the bot" do
      expect(@toy_robot.report).to eq("3,2,WEST")
    end
  end



  describe "if bot is placed facing EAST direction" do
    before(:each) do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","3","2","EAST"
    end
    it "places bot at 3,2 co-ordinates and faces east " do
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("EAST")
    end

    it "it should move the bot in the EAST direction by 1 step " do
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("4")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("EAST")
    end

    it "should turn left by 90 degrees to NORTH and the postion should be the same" do 
      @toy_robot.turn LEFT
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("NORTH")
    end

    it "should turn right by 90 degrees to SOUTH and the postion should be the same" do
      @toy_robot.turn RIGHT
      expect(@toy_robot.x).to eq("3")
      expect(@toy_robot.y).to eq("2")
      expect(@toy_robot.direction).to eq("SOUTH")
    end

    it "should report position of the bot" do
      expect(@toy_robot.report).to eq("3,2,EAST")
    end
  end

  describe "a bot shall not move" do
    it "a bot shall not move in west direction if it is placed 0,0,WEST" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","0","0","WEST"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("0")
      expect(@toy_robot.y).to eq("0")
      expect(@toy_robot.direction).to eq("WEST")
    end
    it "a bot shall bot move in south direction if it is placed 0,0,SOUTH" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","0","0","SOUTH" 
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("0")
      expect(@toy_robot.y).to eq("0")
      expect(@toy_robot.direction).to eq("SOUTH")
    end
    it "a bot shall not move in west direction if it is placed 0,5,WEST" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","0","5","WEST"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("0")
      expect(@toy_robot.y).to eq("5")
      expect(@toy_robot.direction).to eq("WEST")
    end
    it "a bot shall not move in north direction if it is placed 0,5,NORTH" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","0","5","NORTH"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("0")
      expect(@toy_robot.y).to eq("5")
      expect(@toy_robot.direction).to eq("NORTH")
    end
    it "a bot shall not move in north direction if it is placed 5,5,NORTH" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","5","5","NORTH"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("5")
      expect(@toy_robot.y).to eq("5")
      expect(@toy_robot.direction).to eq("NORTH")
    end
    it "a bot shall not move in east direction if it is placed 5,5,EAST" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","5","5","EAST"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("5")
      expect(@toy_robot.y).to eq("5")
      expect(@toy_robot.direction).to eq("EAST")
    end                                     
    it "a bot shall not move in east direction if it is placed 5,0,EAST" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","5","0","EAST"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("5")
      expect(@toy_robot.y).to eq("0")
      expect(@toy_robot.direction).to eq("EAST")
    end
    it "a bot shall not move in south direction if it is placed 5,0,SOUTH" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","5","0","SOUTH"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("5")
      expect(@toy_robot.y).to eq("0")
      expect(@toy_robot.direction).to eq("SOUTH")
    end
  end


  describe "a bot shall move" do
    it "a bot shall move in east direction if it is placed 0,0,EAST" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","0","0","EAST"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("1")
      expect(@toy_robot.y).to eq("0")
      expect(@toy_robot.direction).to eq("EAST")
    end
    it "a bot shall move in north direction if it is placed 0,0,NORTH" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","0","0","NORTH" 
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("0")
      expect(@toy_robot.y).to eq("1")
      expect(@toy_robot.direction).to eq("NORTH")
    end
    it "a bot shall move in east direction if it is placed 0,5,EAST" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","0","5","EAST"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("1")
      expect(@toy_robot.y).to eq("5")
      expect(@toy_robot.direction).to eq("EAST")
    end
    it "a bot shall move in south direction if it is placed 0,5,SOUTH" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","0","5","SOUTH"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("0")
      expect(@toy_robot.y).to eq("4")
      expect(@toy_robot.direction).to eq("SOUTH")
    end
    it "a bot shall move in south direction if it is placed 5,5,SOUTH" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","5","5","SOUTH"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("5")
      expect(@toy_robot.y).to eq("4")
      expect(@toy_robot.direction).to eq("SOUTH")
    end
    it "a bot shall move in west direction if it is placed 5,5,WEST" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","5","5","WEST"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("4")
      expect(@toy_robot.y).to eq("5")
      expect(@toy_robot.direction).to eq("WEST")
    end                                     
    it "a bot shall move in west direction if it is placed 5,0,WEST" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","5","0","WEST"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("4")
      expect(@toy_robot.y).to eq("0")
      expect(@toy_robot.direction).to eq("WEST")
    end
    it "a bot shall move in north direction if it is placed 5,0,NORTH" do
      @toy_robot = ToyRobot::Bot.get_position_and_direction "PLACE","5","0","NORTH"
      ToyRobot::Bot.get_position_and_direction "MOVE"
      expect(@toy_robot.x).to eq("5")
      expect(@toy_robot.y).to eq("1")
      expect(@toy_robot.direction).to eq("NORTH")
    end
  end
end
