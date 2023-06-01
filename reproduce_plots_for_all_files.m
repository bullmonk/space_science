close all; clear; clc;

% get all data file name prefixes.
files = dir('./data');
files = files([files.isdir] ~= 1);
file_names = {files.name};
clear files;
file_name_prefixes = cellfun(@(x) extractBefore(x, '.'), file_names, 'UniformOutput', false);
clear file_names;
unique_prefix = unique(file_name_prefixes);
clear file_name_prefixes;


% drop figures and save under ./result.
mkdir results/;
for i=1:length(unique_prefix)
    fig = plot_raw_data(unique_prefix{i}, i);
    saveas(fig,fullfile('./results',unique_prefix{i}), 'png');
end