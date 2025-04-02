%{
Machine Vision
Author:     Elias Najjar
Assignment: EGR 102-008
Changed:    12/5/2024

Purpose:
  Describe the contents of a MATLAB script in a form that students
  can use as basis for the header comments of their script files.
%}

close all
clear
clc

% read in the image 
image=imread('CoinsOnBlue.jpg');

% this will make your picture appear on the screen.
imshow(image)

% Use this tool to inspect your image
imageViewer(image);
% Mouse around the image to find the RGB values of the background and the coins

r_channel = image(:,:,1); % red values
g_channel = image(:,:,2); % green values
b_channel = image(:,:,3); % blue values

rg_ratio = double(r_channel)./double(g_channel); % red green ratio
bg_ratio = double(b_channel)./double(g_channel); % blue green ratio

rg_ratio(isnan(rg_ratio)) = 0; % if it is nan it sets it to zero
bg_ratio(isnan(bg_ratio)) = 0; % this should only happen if it is black

coins = rg_ratio > 1.0; % rg ratio > 1.0 means there is a coin

%% This gets rid of noise and turns the logical array into an image
bw = bwareaopen(coins,50); % gets rid of object smaller than 50 pixels area

imshow(bw)
%%
stats = regionprops('table',bw,'Centroid', 'ConvexArea', 'MajorAxisLength','MinorAxisLength');

UsefulTable=stats{:,:}; % Turns stats from a table in to an array

radii = UsefulTable(:,3)/2; % Converts the diameters into radii
centers = UsefulTable(:,1:2); % centers of the coins

%%
figure
  imshow(image)
  hold on
  viscircles(centers, radii); % highlights where the coins are
  hold off
%%
realCoins = UsefulTable(:,3) > 470; % keeps circles with a diameter larger than 470 pixels
CoinTable = UsefulTable(realCoins,:);

newCenters = CoinTable(:,1:2);
newRadii = CoinTable(:,3)/2; % radius is half of the major axis
%%
figure
  imshow(image)
  hold on
  viscircles(newCenters, newRadii);
  hold off

pause(3);
histogram(newRadii,35);
%%
change = 0;
for i = newRadii'
    if i > 320 % quarter
        change = change + 0.25;
    elseif i > 290 % nickel
        change = change + 0.05;
    elseif i > 250 % penny
        change = change + 0.01;
    else % dime
        change = change + 0.1;
    end
end

fprintf("The value of the coins in the image is $%.2f", change)