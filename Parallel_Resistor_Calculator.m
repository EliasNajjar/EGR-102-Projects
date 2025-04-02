%{
Parallel Resistor Calculator
Authors:    Elias Najjar
Assignment: EGR 102-008 Parallel Resistor Calculator
Changed:    9/5/2024

Purpose:
  Take 2 values of resistors in ohms and find the effective resistance
%}

clc
clear

% Get input for the value of the first resistor in ohms
resistor1Value = input("What is the value of the first resistor in ohms? ");
% Get input for the value of the second resistor in ohms
resistor2Value = input("What is the value of the second resistor in ohms? ");

% Calculate effective resistance and assign to variable
effectiveResistance = 1 / (1 / resistor1Value + 1 / resistor2Value);

% Print the effective resistance
fprintf("The effective resistance is: %.2f. \n", effectiveResistance);