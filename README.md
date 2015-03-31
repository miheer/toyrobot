# Toy Robot Simulator

## Description

- The application is a simulation of a toy robot moving on a square tabletop, of
dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented,
however further valid movement commands must still
be allowed. 


##System Dependencies & Configuration
- This code was tested using the following
 - ruby-2.2.1
 - RHEL6.4+ 

##Application Installation Instructions
### Using gem
 
 - git clone 

 - go to your cloned directory

~~~
   $cd toyrobot
~~~

 - Build the gem

~~~
   $gem build bot.gemspec
~~~

 - To install the gem run

~~~
   $gem install bot-1.0.0.gem
~~~ 

 - To install the gem in development environment run

~~~
   $gem install --dev bot-1.0.0.gem 
~~~

### Without building and installing a gem

~~~
  $git clone

  $gem install bundler

  $bundle install
~~~

##Usage Instructions
  You can use 2 modes for feeding instructions to the bot either by file or by manual mode

#### If you have installed a gem then-
 
  1) To have a bot fetch instructions manually run the following-  
~~~
    $bot manual   
~~~ 
  
  2) To have the bot fetch instructions from file run the following-
~~~
   $bot file <filename>  
~~~

#### If you have not installed a gem then-

~~~
    $cd toyrobot
~~~

  1) To have the bot get instructions from user manually run the following-
~~~
      $bin/bot manual
~~~

  2) To have the bot run the instructions from a file run the following-
~~~
      $bin/bot file <your_file>
~~~

#### If you want help to know as to how to run commands-

  1) If you have installed a gem then-

~~~
       $bot help
~~~

  2) Else if you have not installed the gem then- 
~~~
       $bin/bot help
~~~

##Overview
- The bot application can read in commands of the following form -

~~~
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
~~~
- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
sequence of commands may be issued, in any order, including another PLACE
command. The application should discard all commands in the sequence until a
valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is currently
facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form, but
standard output is sufficient.
- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT 
and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

###Constraints
The toy robot must not fall off the table during movement. This also includes
the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.


###Example Input and Output
~~~
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
~~~

~~~
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
~~~

~~~
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
~~~


##TESTING INSTRUCTIONS

Run the following to run the test cases

~~~

#rspec spec/

~~~

Copyright (c) 2015 Miheer Pravin Salunke

See [MIT LICENSE](./LICENSE.txt)  for details.


