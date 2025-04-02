%{
Volumetric Flow Rate Calculator
Authors:    Elias Najjar
Assignment: EGR 102-008 
Changed:    9/14/2024

Purpose:
  Takes user input for pipe diameter and velocity and calculates volumetric
  flow rate. Volumetric flow rate is shown in cubic meters per minute and
  cubic feet per minute.
%}

clear
clc

% VVS Logo
fprintf("*** *** Victory\n ** **  Volume\n  * *   Solutions\n   *\n\n")

% Take input for the diameter in inches and velocity in feet per seconds
diameterIn = input("Enter the pipe diameter in inches: ");    
velocityFtSec = input("Enter the velocity in ft/sec: ");

% Convert diameter from inches to feet
diameterFt = diameterIn / 12;

% Find and display cross-sectional area
area = diameterFt ^ 2 * pi / 4;
fprintf("The cross-sectional area of the pipe is %.2f ", area)
fprintf("square feet\n")

% Find velocity in feet per minute
velocityFtMin = velocityFtSec * 60;

% Find volumetric flow rate in cubic feet per minute
vfrFt = area * velocityFtMin;

% Find volumetric flow rate in cubic meters per minute
vfrM = vfrFt * 0.3048 ^ 3;

% Display volumetric flow rates
fprintf("The volumetric flow rate is %.2f cubic feet per minute or %.2f cubic meters per minute.", vfrFt, vfrM)

%{
Testing Notes

Inputs: diameter 1.9; velocity 100.5
Outputs: area 0.02; vfrFt 118.73; vfrM 3.36
Calculations correct

Inputs: diameter -1.9; velocity 100.5
Outputs: area 0.02; vfrFt 118.73; vfrM 3.36
Outputs are the same despite the negative diameter. Diameter is squared so
the same area results. Makes sense as the diameter is the same length

Inputs: diameter -1.9; velocity -100.5
Outputs: area 0.02; vfrFt -118.73; vfrM -3.36
Negative velocity makes volumetric flow rate negative. Makes sense as
liquid would be leaving the container

Inputs: diameter 0; velocity 0
Outputs: area 0; vfrFt 0; vfrM 0
Calculations make sense

Inputs: diameter Inf; velocity Inf
Outputs: area Inf; vfrFt Inf; vfrM Inf
Calculations make sense

Inputs: diameter Inf; velocity 0
Outputs: area Inf; vfrFt NaN; vfrM NaN
Area makes sense and volumetric flow rate makes sense because Inf * 0 is
NaN in MATLAB

Inputs: diameter 0; velocity Inf
Outputs: area 0; vfrFt NaN; vfrM NaN
Calculations make sense

Inputs: diameter a (or any non-number)
Error, must input number. Same for velocity
%}