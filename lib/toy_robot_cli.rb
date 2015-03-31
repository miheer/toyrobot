require 'thor'
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'toy_robot'
require 'toy_robot_cli_helper'
module ToyRobotCli
  class BotCli < Thor

    @@command_execute_block = proc do |command|
      ToyRobot::Bot.get_result(command.split(/[\s,]+/))
    end

      desc 'file input', 'file <filename>'
      method_option :file, :aliases => "-f", :desc => "Use File mode"

      def file(file)
        ToyRobotCliHelper::CliHelper.get_file_instructions(@@command_execute_block, file)
      end

      desc 'manual input', 'manual'
      method_option :manual, :aliases => "-m", :desc => "Use manual mode"

      def manual
        print '>>'
        ToyRobotCliHelper::CliHelper.get_instruction_manually(@@command_execute_block)
      end

      desc 'help for using input modes', 'help'
      method_option :help, :aliases => "-h", :desc => "Help for using input modes"

      def help
        puts "******* toy_robot mode help***********\n"\
          "To use file mode run bot file <file> \n"\
          "To use manual mode run bot manual \n"\
          "*********************************\n"
      end

    end
  end


