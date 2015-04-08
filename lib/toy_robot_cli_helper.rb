module ToyRobotCliHelper
  class CliHelper

    def self.get_instruction_manually(command_execute_block)
      while command = STDIN.gets
        command_execute_block.call(command)
        print '>>'
      end
    end

    def self.get_file_instructions(command_execute_block, file)
      #begin
        File.readlines(file).map do |command|
          command_execute_block.call(command.strip.chomp) unless command.strip.chomp.empty?
        end
      #rescue
        #puts "File not given or doesn't exists"
      #end
    end

  end
end
