# Brief Introduction
## Quick Set Up
1. clone repo
2. create `data` folder under cloned folder `space_science`.
    ```
    cd /your/path/to/space_science
    mkdir data
    ```
3. put `.dat` files to `space_science/data` folder.
4. use provided functions with working directory = `space_science`

## Folder Structure
all `.dat` files should go to `./data`, other non-script files go to `./others`. Scripts can be put under current directory.

## Scripts
- `plot_raw_data.m`
    - A ploting function, input a file prefix name (`ready_DMSP18_flux_20201001_065020` for example). It will plot flux heatmap and location-time line plot, based on corresponding `.L.dat` and `.flux.dat`/`.per.dat` files (`ready_DMSP18_flux_20201001_065020.L.dat` for example).
    - Example usage: 
        ```
        close all; clear; clc;
        plot_raw_data('ready_DMSP18_flux_20201001_065020');
        ```
- `get_window_panel.m`
    - A helper function for `plot_raw_data.m`. Being used to make figure sit in the middle of screen.
    - Can be ignored.