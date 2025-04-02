%{
Metric Flash Cards
Author:     Elias Najjar
Assignment: EGR 102-008
Changed:    10/24/2024

Purpose:
  Make flash cards for a user to review metrix prefixes and exponents
%}

clear
clc

% bring in given prefixes and exponents
metricTable = readtable("metricPrefixes.xlsx");

prefixNames = string(metricTable.prefix);  % Create an array of strings
prefixExponents = double(metricTable.exponent);  % Create an array of numbers
prefixAbbreviations = string(metricTable.abbreviation); % create an array of strings

% show logo
fprintf("//----------------------\\\\\n||  METRIC FLASH CARDS  ||\n\\\\----------------------//\n");

% input the number of prefixes the user would like to practice
numPrefixes = input("How many prefixes would you like to review?: ");

% array to hold row values and variables for the number gotten correct
rowNumsList = zeros(1,numPrefixes);
numAbbreviationsCorrect = 0;
numExponentsCorrect = 0;

% for however many times the user chose
for x = 1:numPrefixes
   % randomly pick a prefix
   rowNumber = randi(length(prefixNames));
   
   % adjust current variables to check if input is correct
   currentPrefix = prefixNames(rowNumber);
   currentAbbreviation = prefixAbbreviations(rowNumber);
   currentExponent = prefixExponents(rowNumber);

   % add rowNumber to rowNumsList
   rowNumsList(x) = rowNumber;
   
   % show the user the prefix
   fprintf("The metric prefix is: %-5s\n", currentPrefix);
   
   % get abbreviation guress from the user
   abbreviationGuess = input("What is the abbreviation? ", 's');
   
   % if abbreviation is correct, tell the user so; if it is incorrect, tell
   % the user the correct abbreviation
   if abbreviationGuess == currentAbbreviation
        disp("Abbreviation is correct!")
        numAbbreviationsCorrect = numAbbreviationsCorrect + 1;
    else
        fprintf("The correct abbreviation is: %-2s\n", currentAbbreviation);
    end
    
    % get exponent guess from the user
    exponentGuess = input("What is the exponent? ");

    % if exponent is correct, tell the user so; if it is incorrect, tell
    % the user the correct exponent
    if exponentGuess == currentExponent
        fprintf("Exponent is correct!\n\n")
        numExponentsCorrect = numExponentsCorrect + 1;
    else
        fprintf("The correct exponent is: %-3s\n\n", string(currentExponent));
    end
    % give the user a half second break
    pause(0.5)
end

% if none were reviewed, say so and thank the user
if isempty(rowNumsList)
    disp("No prefixes were reviewed.")
else % if some were reviewed, display the box, the number reviewed, the 
    % numbers of abbreviations and exponents correct, and the percentages
    % correct
    fprintf("//-------------------------------------------\\\\\n|| SESSION REVIEW                            ||\n||-------------------------------------------||\n");
    fprintf("|| Number of Prefixes Reviewed:   %d          ||\n", numPrefixes);
    fprintf("|| Correct Abbreviations:         %d (%5.1f%%) ||\n", numAbbreviationsCorrect, 100*numAbbreviationsCorrect/numPrefixes);
    fprintf("|| Correct Exponents:             %d (%5.1f%%) ||\n", numExponentsCorrect, 100*numExponentsCorrect/numPrefixes);
    fprintf("||-------------------------------------------||\n|| REVIEWED PREFIXES                         ||\n||-------------------------------------------||\n");
    for x = rowNumsList % for each reviewed, print the prefix and answers
        fprintf("|| %-5s %-2s 10^%-3s                           ||\n", prefixNames(x), prefixAbbreviations(x), string(prefixExponents(x)))
    end
    % close the box
    fprintf("\\\\-------------------------------------------//\n\n");
end

% thank the user
disp("Thank you for using Metric Flash Cards!")