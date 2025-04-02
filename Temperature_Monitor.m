%{
Temperature Monitor
Author:     Elias Najjar
Assignment: EGR 102-008
Changed:    10/3/2024

Purpose:
  Read the voltage from the arduino board and use it to calculate
  temperature and stop the program when a certain temperature is reached
%}

clear
clc

% connect the arduino and make variables to tell what temp to stop at
a = arduino();
tempCutoff = 80;
roomTempF = 0;

while roomTempF < tempCutoff % if true, the temp is not high enough
    
    % read the voltage at A0
    voltage = readVoltage(a, 'A0');
    
    % find the resistance given the voltage
    rThermistor = voltageToResistance(voltage);
    
    % find the temp given resistance
    roomTempF = ResistanceToTempF(rThermistor)

    % give some time for the temp to change
    pause(2)

end

% when the cutoff temp is reached, turn the light on to indicate the
% program is done
writeDigitalPin(a, 'D9', 1);