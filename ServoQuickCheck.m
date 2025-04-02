% This code was revised September 24, 2020 by Julie Whitney
% It contains both servo connect commands I know of to test with different
% servos.  This code looks for a servo on pin D9.
 
clear all
 
a=arduino()
 
s1 = servo(a, 'D9', 'MinPulseDuration', 700*10^-6, 'MaxPulseDuration', 2300*10^-6);
% If you get an IOServerBlock error when the servo moves, try this instead:
%s1=servo(a,'D9','MinPulseDuration', 1*10^-3, 'MaxPulseDuration', 2e-3);

% start with Gate down
writePosition(s1, 0);
 
pause (2)
writePosition(s1, 0.5);
 
disp('done');