module ToyRobot
  class Bot  
    attr_reader :command, :x, :y, :direction

    MAX_X ||= 5 #unless const_defined?(:MAX_X)
    MAX_Y ||= 5 #unless const_defined?(:MAX_Y)
    DIRECTIONS ||= %w(NORTH EAST SOUTH WEST) #unless const_defined?(:DIRECTIONS)
    LEFT ||= -1 #unless const_defined?(:LEFT)
    RIGHT ||= 1 #unless const_defined?(:RIGHT)

    def initialize(command, x = nil, y = nil, direction = nil)
      @command = command
      @x = x
      @y = y
      @direction = direction 
    end

    def self.get_result(command)
      get_position_and_direction(*command)
    end             

    def self.get_position_and_direction(command = nil, x = nil, y = nil, direction = nil)
      case command
      when 'PLACE'
        @toy_robot = ToyRobot::Bot.place(command, x , y, direction) if x and y and direction
      when "MOVE","EXIT","HELP"
        @toy_robot.send(command.downcase) if @toy_robot #and @x and @y and @direction
      when 'LEFT'
        @toy_robot.turn LEFT if @toy_robot #and @x and @y and @direction
      when 'RIGHT'
        @toy_robot.turn RIGHT if @toy_robot #and @x and @y and @direction
      when 'REPORT'
        puts @toy_robot.report if @toy_robot #and @x and @y and @direction
      end
    end

    def self.check_feasibility(x, y)
      x <= MAX_X && x >= 0 && y <= MAX_Y && y >= 0 ? true : false
    end

    def self.place(command, x, y, direction)
      if self.check_feasibility x.to_i , y.to_i
        @toy_robot = Bot.new(command, x, y, direction) if x && y
      end
    end

    def move
      case @direction
      when 'WEST'
        @x = (@x.to_i - 1).to_s if ToyRobot::Bot.check_feasibility(@x.to_i - 1, @y.to_i)
      when 'EAST'
        @x = (@x.to_i + 1).to_s  if ToyRobot::Bot.check_feasibility(@x.to_i + 1, @y.to_i)
      when 'NORTH'
        @y = (@y.to_i + 1).to_s if ToyRobot::Bot.check_feasibility(@x.to_i, @y.to_i + 1)
      when 'SOUTH'
        @y = (@y.to_i - 1).to_s  if ToyRobot::Bot.check_feasibility(@x.to_i, @y.to_i - 1)
      else
        #do nothing
      end
    end

    def turn(direction)
      index = DIRECTIONS.index(@direction)
      @direction = DIRECTIONS.rotate!(direction)[index]
    end

    def exit
      abort("Bye")
    end

    def help
      puts  "*******Instruction Set:***********\n"\
        "PLACE x-co-ordinate,y-co-ordinate, direction to which bot shall face\n"\
        "MOVE Move the bot by 1 step in the direction which it is facing \n"\
        "LEFT turn the bot to left by 90 degrees \n"\
        "RIGHT turn the bot to right by 90 degrees\n"\
        "REPORT show position of bot with the direction it is facing\n"\
        "EXIT\n"\
        "*********************************\n"
    end

    def report
      "#{@x},#{@y},#{@direction}"
    end
  end
end
