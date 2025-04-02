%{
Error-Checking Resistor Calculator With Current
Authors:    Elias Najjar
Assignment: EGR 102-008 Error Checking Resistor Calculator
Changed:    9/19/2024

Purpose:
  Take 2 values of resistors in ohms and find the effective resistance and
  current. Convert negative inputs to positive if applicable. Tell the user
  if the current is safe or not by comparing the current to the maximum
  current.
%}

clc
clear

% assign arduino source voltage (voltage in)
arduSourceVoltage = 5; % volts

% assign LED forward voltage (voltage in LED to be subtracted from voltage in)
LEDforwardVoltage = 1.85; % volts

% assign LED maximum current (to compare to calculated current and warn user)
LEDmaximumCurrent = 30; % milliamps

% get input for the value of the first resistor in ohms
resistor1Value = input("What is the value of the first resistor in ohms? ");
% if input is negative, make it positive
if resistor1Value < 0
    disp("Negative resistance, reversing.\n")
    resistor1Value = -resistor1Value;
end

% get input for the value of the second resistor in ohms
resistor2Value = input("What is the value of the second resistor in ohms? ");
% if input is negative, make it positive
if resistor2Value < 0
    fprintf("Negative resistance, reversing.\n")
    resistor2Value = -resistor2Value;
end

% calculate effective resistance and assign to variable
effectiveResistance = 1 / (1 / resistor1Value + 1 / resistor2Value);

% print the effective resistance
fprintf("The effective resistance is: %.2f. \n", effectiveResistance);

% calculate the current in amps
currentInAmps = (arduSourceVoltage - LEDforwardVoltage) / effectiveResistance;

% find the current in miliamps to compare with maximum current
currentInMilliamps = currentInAmps * 1000;

% if the current in miliamps is greater than the maximum current, the user
% must be warned; otherwise, the user is safe
if currentInMilliamps > LEDmaximumCurrent
    fprintf("WARNING: Unsafe current.\n")
else
    fprintf("Current is safe.\n")
end

% display current in miliamps
fprintf("The current in miliamps is: %f.", currentInMilliamps);