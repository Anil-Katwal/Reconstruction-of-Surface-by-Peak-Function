% Load your data
% L = load('Tshape.mat');
% x = L.x;
% y = L.y;
% z = L.z;
load('Tshape.mat')
% Define the grid for interpolation
% [X, Y] = meshgrid(linspace(min(x), max(x), 500), linspace(min(y), max(y), 500));
[X, Y] = meshgrid(linspace(0, 1, 100), linspace(0, 1, 100));
% Interpolate the data
Z_interp = griddata(x, y, z, X, Y); % Cubic interpolation

% Define the conditions for cutting surfaces
x0 = [0.00; 0.28; 0.28; 0.00]; 
y0 = [0.00; 0.00; 0.5; 0.5];
% x1 = [0.769; 1; 1; 0.769];
x1 = [0.76; 1; 1; 0.76];
y1 = [0.00; 0.00; 0.5; 0.5];

% Create interpolation regions for the regions to be removed
int0 = inpolygon(X, Y, x0, y0);
int1 = inpolygon(X, Y, x1, y1);

% Combine the interpolation regions using logical OR
int = int0 | int1;

% Apply the interpolation to set points to NaN in the interpolated data
Z_interp(int) = NaN;

% Create a new figure and axis
f = figure;
ax = axes;

% Create the surface plot using the modified interpolated data
s = surface(X, Y, Z_interp);
s.EdgeColor = 'none';
view(-45, 75);

% Set a custom colormap (e.g., jet, hot, cool, etc.)
colormap('jet');

% Labeling and title
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Interpolated Surface');
grid on

% Add a colorbar for reference
colorbar;
