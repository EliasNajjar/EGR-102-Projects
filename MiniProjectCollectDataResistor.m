%{
MiniProjectCollectData - Collect data to train a resistor classfier

Authors: Valerie Vogel and Neil Moore
Assignment: EGR 102 Mini-Project, Fall 2023
Date: 2023-10-26

Purpose:  This program collects data by measuring the voltage obtained
  from four different resistor values in a voltage divider.  Each kind of
  resistor is measured five times, and the resulting data is written to a
  spreadsheet MiniProjectData.xlsx.  See the comment on the "readings"
  array for the structure of the generated spreadsheet.  This spreadsheet
  will be used for training a machine-learning algorithm to produce a
  decision tree.

  This is NOT the final program that will drive your resistor classifier
  and that will be listed in your report.  Instead, this program is used
  to collect data for training the machine-learning algorithm.

  You might use parts of this code in your final program, but that
  should be in a separate script file.  If you do use any of this code,
  you should credit this file and its author in the "Notes" section of
  your header comment.
%}

clear
a = arduino();

% the four resistors you will distinguish
resistors = [ "330 Ohm", "1k Ohm", "10K Ohm", "47K Ohm" ];
% Perform the experiment five times.
num_replicates = 5;
% Spreadsheet file to generate at the end.
spreadsheet = "MiniProjectData.xlsx";


% Create matrix
% Rows are single tests of a single material:


%    rows 1 through 5:   330 Ohm Resistors
%    rows 6 through 10:  1k Ohm Resistors
%    rows 11 through 15: 10K Ohm Resistors
%    rows 16 through 20: 47K Ohm Resistors
% Columns are measurements:
%    1. material number  2. reading  
readings = zeros(20, 2);

for replicate = 1 : num_replicates
    % Test three different materials per experiment.
    fprintf("Beginning replicate %d\n", replicate);
    
    for resistor = 1 : length(resistors)
        % Row number in the array.  This puts replicate 1 in rows
        % 1, 6, 11; replicate 2 in rows 2, 7, 12; and so on.
        % The first 5 rows will be 330 Ohm Resistors, the next 5 1K Ohm Resistors,
        % the next 5 10K Ohm Resistors, and the last 5 47K Ohm Resistors.
        row = replicate + (resistor - 1) * num_replicates;
        
        fprintf("Insert resistor %s ", resistors(resistor));
        input("and press enter", 's'); % The actual input is ignored
        
        % Put the material number (1, 2, 3, or 4) into column 1
        readings(row, 1) = resistor;
      
        %Take readings     
        pause(0.1);
        readings(row, 2) = readVoltage(a, 'A0');
        pause(0.1);

    end   
    fprintf("Completed replicate %d\n\n", replicate);
end

disp("Sensor measurements have been collected in the array 'readings'");

% Write the spreadsheet file
writematrix(readings, spreadsheet)
fprintf("Spreadsheet %s created.\n", spreadsheet);
