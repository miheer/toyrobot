module ToyRobot
  class Bot  
    attr_accessor :command, :x, :y, :direction

    MAX_X = 5 unless (const_defined?(:MAX_X))
    MAX_Y = 5 unless (const_defined?(:MAX_Y))
    DIRECTIONS = ["NORTH","EAST","SOUTH","WEST"] unless (const_defined?(:DIRECTIONS))
    LEFT = -1 unless (const_defined?(:LEFT))
    RIGHT = 1 unless (const_defined?(:RIGHT))

    def initialize(command, x = nil, y = nil, direction = nil)
      @command = command
      @x = x
      @y = y
      @direction = direction 
    end

    def self.get_position_and_direction(command=nil, x=nil, y=nil, direction=nil)
      case command
      when "PLACE"
        if self.check_feasibility x.to_i , y.to_i
          @toy_robot = Bot.new(command, x, y, direction) if x and y
        end 
      when "MOVE"
        self.move
      when "LEFT"
        self.turn LEFT if @toy_robot
      when "RIGHT"
        self.turn RIGHT if @toy_robot
      when "REPORT"
        puts self.report if @toy_robot
      when "EXIT"
        abort("Bye")
      when "HELP"
        puts  "*******Instruction Set:***********\n"\
          "PLACE x-co-ordinate,y-co-ordinate, direction to which bot shall face\n"\
          "MOVE Move the bot by 1 step in the direction which it is facing \n"\
          "LEFT turn the bot to left by 90 degrees \n"\
          "RIGHT turn the bot to right by 90 degrees\n"\
          "REPORT show position of bot with the direction it is facing\n"\
          "EXIT\n"\
          "*********************************\n"
      else
        #Ignore
      end 
    end

    private

    def self.get_result command
      self.get_position_and_direction(*command)
    end

    def self.check_feasibility x, y
      x <= MAX_X and x>= 0 and y <= MAX_Y and y>=0 ? true :false
    end

    def self.move 
      if @toy_robot
        case @toy_robot.direction
        when "WEST"
          @toy_robot.x = (@toy_robot.x.to_i - 1).to_s if self.check_feasibility(@toy_robot.x.to_i - 1, @toy_robot.y.to_i)
        when "EAST"
          @toy_robot.x = (@toy_robot.x.to_i + 1).to_s if self.check_feasibility(@toy_robot.x.to_i + 1, @toy_robot.y.to_i)
        when "NORTH"
          @toy_robot.y = (@toy_robot.y.to_i + 1).to_s if self.check_feasibility(@toy_robot.x.to_i, @toy_robot.y.to_i + 1)
        when "SOUTH"
          @toy_robot.y = (@toy_robot.y.to_i - 1).to_s if self.check_feasibility(@toy_robot.x.to_i, @toy_robot.y.to_i - 1)
        end
      end
    end

    def self.turn(direction)
      if @toy_robot
        index = DIRECTIONS.index(@toy_robot.direction)
        @toy_robot.direction = DIRECTIONS.rotate!(direction)[index]     
      end     
    end

    def self.report 
      if @toy_robot
        "#{@toy_robot.x},#{@toy_robot.y},#{@toy_robot.direction}"
      end
    end
  end
end
