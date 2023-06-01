function[left, bottom, width, height] = get_window_panel()
screen_size = get(groot, 'ScreenSize');
width = screen_size(3)/3;
height = screen_size(4)/3;
left = 1 + width;
bottom = 1 + height;
end