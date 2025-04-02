%{
Decision Tree
Author:     Elias Najjar
Assignment: EGR 102-008
Changed:    11/20/24

Purpose:
  Make a decision tree to figure out what ranges of voltage readings align
  with which resistors.
%}

clear
clc

myData = readmatrix("MiniProjectData.xlsx");
trainingData = myData(:,2);

result = strings(20,1);

result(1:5) = "330 Ohm";
result(6:10) = "1K Ohm";
result(11:15) = "10K Ohm";
result(16:20) = "47K Ohm";

tree = fitctree(trainingData, result);

view(tree, 'mode', 'graph');