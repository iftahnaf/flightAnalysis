# fw_px4_plottools
Plotting tools for reading and showing Pixhawk uLog logs in Matlab.

## Installation
  1. The pyulog package needs to be installed: `pip install pyulog`

## logconv.m
Script to convert .ulg files first to .csv files and then import it to matlab. Adjust the necessary parameters such as file name, loading mode or if the plots should be displayed. The log file must be placed in the `04_log_files` folder. If any plots should be displayed adjust the necessary parameters in `01_draw_functions/DisplayPX4LogData.m`. A successful run of the script produces following outputs:
  1. The desired plots
  2. The .csv files in the `05_csv_files` folder if they should be kept
  3. The saved sysvector in the `06_mat_files` folder
  4. The generated .kmz file for Google Earth in `07_kmz_files` folder if the global position estimation plots are executed.

## Adding new Plots
  1. Generate the plotting function in `01_draw_functions/01_subfunctions`
  2. Add the function call and parameters, if required, in the `DisplayPX4LogData.m` script.
  3. If the axes should be linked to other figures add the figure indexes in the `LinkFigureAxes.m` function.

## matlab GUI addon

run ulogGUI from matlab command line to start the gui.
