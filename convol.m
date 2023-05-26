x = sin(2*pi*nx/50) + sin(20*pi*nx/50);
h = 0.1*ones(1,10); % 10-point moving avg filter
nx = [0 : 100]; %size of x
nh = [0 : 9]; %size of h, -1 : 4

[y, ny] = convolve(x, h, nx, nh);
stem(ny,y) %plot y graph against ny
grid on;

function [y,ny] = convolve(x,h,nx,nh)
    ny_min = nx(1) + nh(1); % lowest value of each added make new low val
    ny_max = nx(length(x)) + nh(length(h)); %length of x or h
    ny = [ny_min:ny_max];
    y = conv(x,h);
end
