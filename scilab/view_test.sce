// Clear environment
clear;
clc;

// File name
filename = "test_n.txt";

// Read data from file (all rows, 17 columns)
data = read(filename, -1, 17);

// Extract columns for hours, minutes, and seconds
hours = data(:, 4);
minutes = data(:, 5);
seconds = data(:, 6);

// Convert time to seconds and then to minutes from the start
time_seconds = hours * 3600 + minutes * 60 + seconds;
start_time = time_seconds(1);
time_in_minutes = (time_seconds - start_time) / 60;

// Extract columns to plot (temperatures, for example)
column10 = data(:, 10);
column11 = data(:, 11);
column15 = data(:, 15);

// Plot variables versus time
plot(time_in_minutes, column10, 'b-', ...
     time_in_minutes, column11, 'r--', ...
     time_in_minutes, column15, 'g-');

// Labels and legend
xlabel("t (min)", "fontsize", 4);
ylabel("T_s (°C)", "fontsize", 4);

// Current graphic entity
h = gce();
h.legend_location = "in_lower_right";
h.font_size = 4;

// Show grid
xgrid();
