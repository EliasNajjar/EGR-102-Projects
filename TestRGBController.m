% Script to test the RGB Color Controller circuit.

% the circuit has the R, G and B leads plugged into pins D5, D6 and D9
% respectively.  The push button is plugged into D4 (with a pull-down
% resistor).  The potentiometer's middle pin is connected to A0.

clear
a = arduino();

% Quick test of the LED (is it wired right?)
disp('red check');
writeDigitalPin(a,'D5',1);
pause(2);
writeDigitalPin(a,'D5',0);
pause(2);

disp('Green check');
writeDigitalPin(a,'D6',1);
pause(2);
writeDigitalPin(a,'D6',0);
pause(2);

disp('blue check');
writeDigitalPin(a,'D9',1);
pause(2);
writeDigitalPin(a,'D9',0);
pause(2);

% Quick Check of the switch

disp('This will go into a loop until you push the button:');

while readDigitalPin(a, 'D4') == false
    disp('Button is not pushed: push and hold to end loop');
    pause(.2)
end
    
disp('the button works');

% The next step looks to see if the pots are wired correctly

disp('The next step will create a plot');
disp('When the graph comes up, turn the potentiometer and verify you have a line moving');

figure;
analog = zeros(1,100); %holds voltage reads
for index = 1:100 % take and plot 100 readings
   analog(index) = readVoltage(a,'A0');
   pause (.2);   % slow down read speed
   plot (analog); 
   ylim([-1 6]); % set y limits of plot
   xlabel('Time')
   ylabel('Voltage');
end %end for loop
