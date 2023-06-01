
function[fig] = plot_raw_data(file_name_prefix, screen_index)

%-----Load data-----
location_data = readtable(strcat('./data/', file_name_prefix, '.L.dat'), 'VariableNamingRule', 'preserve');

if isfile(strcat('./data/', file_name_prefix, '.flux.dat'))
    flux_data = readtable(strcat('./data/', file_name_prefix, '.flux.dat'), 'VariableNamingRule', 'preserve');
else
    flux_data = readtable(strcat('./data/', file_name_prefix, '.per.dat'), 'VariableNamingRule', 'preserve');
end

t = seconds(location_data.time);
t.Format = 'hh:mm:ss';
mlt = location_data.MLT;
mlat = location_data.("|MLAT|");
% suppose flux data share same origin time as L data.
flux_table_width = size(flux_data, 2);
incremental = 1:1:flux_table_width;
ft = zeros(1, flux_table_width);
ft(1,:) = location_data.time(1);
ft = ft + incremental;
ft = seconds(ft);
ft.Format = 'hh:mm:ss';
% flux_data{:,:}(ismissing(flux_data{:,:}))=0;

%-----Configure figure panel-----
[left, bottom, width, height] = get_window_panel(screen_index);
fig1 = figure('Name', file_name_prefix, 'Position', [left bottom width height]);
figure(fig1)
tiledlayout(2, 1)

%-----Plot energy-time-flux heatmap-----
nexttile;
flux_plot = heatmap(ft, 1:1:size(flux_data, 1), flux_data{:,:}, 'MissingDataColor', 'w', 'Colormap', jet);
xlabel('Time');
ticks = string(ft);
remaining_x_ticks = string(linspace(ft(1), ft(flux_table_width), 8));
ticks(~ismember(ticks, remaining_x_ticks)) = '';
flux_plot.XDisplayLabels = ticks;
s = struct(flux_plot);
s.XAxis.TickLabelRotation=0;
ylabel('energy,keV')

%-----plot location time graph-----
% plot mlt-time line.
nexttile;
ax = gca;
yyaxis left
mlt_plot = plot(t, mlt');
xlabel('Time');
xrange = get(gca, 'xLim');
set(gca, 'XTick', linspace(xrange(1), xrange(2), 8));
ylim("padded");
ylabel('MLT');
ax.YColor = 'k';
mlt_plot.Color = 'k';
mlt_plot.LineWidth = 4;
mlt_plot.DisplayName = 'MLT';

% plot mlat-time line.
hold on
yyaxis right
mlat_plot = plot(t, mlat);
ylim("padded");
ylabel('MLAT');
ax.YColor = 'r';
mlat_plot.Color = 'r';
mlat_plot.LineWidth = 4;
mlat_plot.DisplayName = 'MLAT';
hold off
% visual optimization
ax.FontSize = 20;
legend

fig = gcf;
end
