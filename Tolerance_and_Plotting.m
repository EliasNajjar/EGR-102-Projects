%{
Tolerance and Plotting
Author:     Elias Najjar
Assignment: EGR 102-008
Changed:    10/9/2024

Purpose:
  Graph arrays in MATLAB and use logical arrays to find percentages.
%}

clear
clc
close all % closes plots

% initialize variables
nominalTemp = 99;
tolerance = 10;
minTemp = nominalTemp - tolerance;
maxTemp = nominalTemp + tolerance;

% Read Excel spreadsheet into an array
arrayTemps = readmatrix('ToleranceCountsLab.xlsx');

% Create an array for each column of data in the spreadsheet
arrayWineWater = arrayTemps(:,1);
arrayBasePressure=arrayTemps(:,2);
arrayTempTopColumn = arrayTemps(:,3);

% find number of provided low water temperatures
numWineWaterTemps= length(arrayWineWater);

% print first and last temperature values
fprintf("First wine water temperature in Fahrenheit: %.2f, Last wine water temperature in Fahrenheit: %.2f\n", arrayWineWater(1), arrayWineWater(numWineWaterTemps))

% create logical arrays to determine underTemp and aboveTemp
underTemp = arrayWineWater < minTemp;
aboveTemp = arrayWineWater > maxTemp;

% find percentages of under min and above max
numUnderTemp = sum(underTemp);
underTempPercent = 100 * numUnderTemp / numWineWaterTemps;
numAboveTemp = sum(aboveTemp);
aboveTempPercent = 100 * numAboveTemp / numWineWaterTemps;

% print number of temps too low and too high and their percentages
fprintf("Temperature Too Low (< %.2f F) readings: %d (%.2f %%)\n", minTemp, numUnderTemp, underTempPercent)
fprintf("Temperature Too High (> %.2f F) readings: %d (%.2f %%)\n", maxTemp, numAboveTemp, aboveTempPercent)

% plot the temperatures
scatter(arrayBasePressure,arrayTempTopColumn)
xlabel('Base Pressure (psi)');
ylabel('Top Column Temperature (F)');
title('Base Pressure vs. Top Column Temperature');