%{
 
Class: CECS 271 

Author: James Henry, Jordan Haveelar

Program: EnergyTrackage.m

Goal: Create a program that displays the power consumption in a 
smart home. It will also print the averages, and highlight the peak 
hour.

Note: We need to use rand, sum, bar, and vectors
%}

% Time vector for 24 hours
hours = 0:23;

% Generate random hourly power usage values (in kW)
% Let's assume usage varies between 0.5 kW and 2.5 kW
usage = 0.5 + (2.5 - 0.5) * rand(1, 24); 

% Peak usage and hour functions right here
[maxUsage, peakHourIndex] = max(usage);
peakHour = hours(peakHourIndex);

% edge case: What if the power equals at different times?
peakHourIndices = find(usage == maxUsage); % All indices with max usage
peakHours = hours(peakHourIndices);        % Convert to actual hours

% Total energy used in 24 hours, using the sum function
totalUsage = sum(usage);

% Remove the comments here to see the data in the command window
fprintf('Total Energy Used: %.2f kWh\n', totalUsage);
fprintf('Peak Usage: %.2f kW at %d:00\n', maxUsage, peakHour);

% Bar grap
figure;
bar(hours, usage, 'FaceColor', [0.2 0.6 0.8]);
hold on;
bar(peakHour, maxUsage, 'FaceColor', 'r'); % Highlights peak hour in red
xlabel('Hour of Day');
ylabel('Power Usage (kW)');
title('Smart Home Hourly Energy Usage');
grid on;
legend('Energy Usage', 'Peak Hour');

%{
 
Sources: 

1. https://www.inspirecleanenergy.com/blog/sustainable-living/how-to-calculate-kwh-kilowatt-hours

2. https://www.mathworks.com/help/matlab/ref/bar.html

3. https://www.mathworks.com/help/matlab/ref/double.colon.html

4. https://www.mathworks.com/help/matlab/ref/rand.html

%}
