%{
Blink LED With MATLAB
Authors:    Elias Najjar
Assignment: EGR 102-008 
Changed: 9/11/2024

Purpose:
  Learning how to use MATLAB to control the arduino board
  Goal is to make the light blink 10 times, then brighten, then dim

%}

clear
clc

% connect to arduino
a = arduino()

% for loop to blink LED
for i = 1:10
    writeDigitalPin(a, 'D9', 1);
    pause(10);
    writeDigitalPin(a, 'D9', 0);
    pause(0.5);

end

% create brightness step variable
stepNum = 20;
brightnessStep = (1-0) / stepNum;

% brighten for loop
for i = 1:stepNum
    writePWMDutyCycle(a, 'D9', i * brightnessStep);
    pause(0.1);

end

% dimming for loop
for i = 1:stepNum
    writePWMDutyCycle(a, 'D9', 1 - i * brightnessStep);
    pause(0.1);

end

% ensure the program has finished
disp('Done!');