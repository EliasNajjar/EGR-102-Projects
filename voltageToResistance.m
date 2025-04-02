%{
Voltage to Resistance Function
Author:     Elias Najjar
Assignment: EGR 102-008
Changed:    10/3/2024

Purpose:
  Convert voltage to resistance given Vout
%}

function [rTherm] = voltageToResistance(vDivider)
    % Calculates resistance given voltage out
    rTherm = (5 - vDivider) / (vDivider / 10000);
end