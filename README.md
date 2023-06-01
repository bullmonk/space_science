# Current Progress
- [x] reproduction of flux heatmap and location line plot, with time as x-axis
- [] replace time axis with MLAT
- [] interpolation between energy band 

# Brief Introduction
## Quick Set Up
1. clone repo
2. create `data` folder under cloned folder `space_science`.
    ```
    cd /your/path/to/space_science
    mkdir data
    ```
3. put `.dat` files to `space_science/data` folder.
4. run the `reproduc_plots_for_all_files.m` script with matlab run button. (it will reproduce all figures and dump into `./results` folder)

## Folder Structure
- All `.dat` files should go to `./data`
- Other non-script files go to `./others`
- Scripts can be put under current directory
- All results will be dumped into `./results` folder.

## Scripts
- `plot_raw_data.m`
    - A ploting function, input a file prefix name (`ready_DMSP18_flux_20201001_065020` for example), and a random positive integer (used to calculate the position in your screen). It will plot flux heatmap and location-time line plot, based on corresponding `.L.dat` and `.flux.dat`/`.per.dat` files (`ready_DMSP18_flux_20201001_065020.L.dat` for example).
    - Example usage: 
        ```
        close all; clear; clc;
        plot_raw_data('ready_DMSP18_flux_20201001_065020', 1);
        ```
- `get_window_panel.m`
    - A helper function for `plot_raw_data.m`. Being used to make figure sit in the middle of screen.
    - Can be ignored.

- `reproduce_plots_for_all_files.m`
    - script that plot for all files under `./data`