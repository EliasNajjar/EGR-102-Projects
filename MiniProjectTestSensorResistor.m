% This code was written so that you can test individual pieces of your MiniProject Sensor (resistor classifier) Fall 2023.
% code written by Julie Whitney 11/15/2021 and Valerie Vogel 9/29/2023

% Note this code is meant to be copied and pasted to the command line to check out any particular
% part of the sensor you want to test.

% Start by connecting to the arduino
clear all

a = arduino(); %only needed if arduino not connected
s1=servo(a,'D9','MinPulseDuration', 700e-6, 'MaxPulseDuration', 2300e-6); % initialize servo

% TEST THE LEDs, servo, and voltage divider circuit

%  ********************************************************************
    %COPY AND PASTE this section of the code to the command line to test
    %your RED LED
        writeDigitalPin(a,'D5',1); % turn on
        pause(2);
        writeDigitalPin(a, 'D5', 0); % turn off  
         
 
       % **************************************************************
       % COPY AND PASTE this to the command line to test the Yellow or
       % Green LED
       
        writeDigitalPin(a,'D6',1); % turn on
        pause(2);
        writeDigitalPin(a,'D6',0); % turn off
        
     % ****************************************************************** 
       % COPY AND PASTE this to the command line to test the servo
        writePosition(s1, 0);
        writePosition(s1, 0.5);
        writePosition(s1, 1);
    % COPY AND PASTE this to the command line to test the voltage divider
    % Place a 10K Ohm resistor in both the R1 and R2 position, the voltage
    % should be around 2.5 volts

    voltage = readVoltage(a, 'A0');
    fprintf('The voltage reading is %.1f volts.\n', voltage);




        
