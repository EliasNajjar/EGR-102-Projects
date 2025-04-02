%{
Roller Coaster App
Author:     Elias Najjar
Assignment: EGR 102-008
Changed:    10/17/2024

Build an app in MATLAB that will control the servo motor using a
photoresistor
%}

% Start by clearing values to keep from getter errors from connectin to the
% Arduino when already connected.
clear
clc
% Initalize Arduino
a=arduino();

% Intialize servo
%************************************************************************
% Set up the fact that there is a servo present. Create the servo connection
% code that will create a servo called s1 that is connected to your Arduino
% called "a". Place that line of code here.
%************************************************************************


% This variable will be used as an ACCUMULATOR to count the riders who have boarded
totalNumRiders = 0; 

% Start with Gate up, so no passengers can load
%*************************************************************************
% Start with the Gate Up. Assume that is the 0.5 (half way) location. Place
% a line of code that will block the passengers from loading. Use the
% writePosition command. Place that line of code here. Also use a disp
% command to display the following: "Gate is up, loading can begin when
% rider is detected." This will help in troubleshooting your code if
% needed.
%*************************************************************************


% Create a loop for number of passengers
%************************************************************************
% Create a while loop that will run as long as the number of passengers is
% less than 5. Place that line of code here.
%************************************************************************

% Reads voltage from photoresistor
%***********************************************************************
% Create a command that reads the value from the sensor (photoresistor.
% This command does that:
    sensor = readVoltage(a, 'A0'); 

% Check for riders
%***********************************************************************
% Create an if statement that checks to see if a passenger is covering
% the sensor. Use the threshold value that you found from the
% ReadAnalogMinMax program. If the sensor is covered, the gate position
% will lower so a passenger can board. Assume that position is 1. Be sure to
% increment the number of totalRiders by 1. Then pause for two seconds
% using the pause(2) command. To help with troubleshooting, you should also
% use an fprintf statement that indicates the riders currently in the
% queue.
%***********************************************************************

%***********************************************************************
% For the else statement, the sensor will not be covered which means the
% gate should be up in the 0.5 position. Be sure to use the disp command to
% display "No riders in the queue." This will help with troubleshooting.
% Then pause for two seconds.
%************************************************************************

  
end %end of the while loop

% Place gate in locked position, ride is full and will begin soon 
%************************************************************************
% The while loop will end when the ride is full which is a total of five
% passengers. Use the writePosition command to place the gate in a locked 
% position which means the ride is full and in progress. Assume position 0
% for this. Use the display command to say "Ride is full, gate is in locked
% position, ride will begin soon."
%************************************************************************


     