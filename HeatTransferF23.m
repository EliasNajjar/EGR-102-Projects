%{
Debugging a Heat Transfer Program
Authors:    Elias Najjar
Assignment: EGR 102-008
Changed:    9/25/2024

Purpose:
  Understand how to debug a program with syntax and logical errors. Program
  should correctly calculate the heat transfer per unit area of a furnace
  wall and output a number just below 1000 in Watts/square meter
%}

% This program calculates the heat transer rate per unit area of a furnace
% wall.  The basic heat transfer equation for conduction is given by
% q=kA(T2-T1)/d where q is the heat transfer rate, k is the thermal
% conductivity - a material property, A is the surface area of the items in
% contact and d is the thickness (depth).  In this case we want heat
% transfer rate per unit area so q/A = k(T2-T1)/d.  If you do this
% calculation on your own, the units need to line up.  Make sure the units
% in k go with the units for temperature and length that you use for A, d
% and T.

clear
clc

% Initialize variables
ThermalConductivity=0.3; % fire clay for a furnace wall in Watts/(meter*Kelvin)
TempInside=650; % This is in C, which I can get away with because delta C = delta K
TempOutside=150; % also in C
Thickness = 0.1524; % 6 inches in meters

% This line calculates the heat transfer per unit area. Errors are that
% ThermalConductivtiy is not the same as ThermalConductivity. Also, we are
% not adding ThermalConductivity, TempInside, and TempOutside, we need to
% multiply ThermalConductivity to the difference between TempInside and
% TempOutside
HeatTransferPerArea=(ThermalConductivity * (TempInside - TempOutside))/Thickness;

% This line prints the heat transfer per unit area. To print, you use
% fprintf not fprint and the string needs to be in quotes. Also,
% HeatTransferWithError is not the same as HeatTransferPerArea
fprintf("Heat transfer per area is %.2f Watts/square meter\n", HeatTransferPerArea);