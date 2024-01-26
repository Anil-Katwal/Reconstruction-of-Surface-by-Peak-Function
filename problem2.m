% Increase the grid resolution
nb = 200;  % Increase the number of theta values
nr = 100;  % Increase the number of radial values

theta = linspace(0, 2*pi, nb);
r = linspace(0, 1, nr);

% Creating parameter for the circular meshgrid
[R, Theta] = meshgrid(r, theta);

% Changing in polar form
X0 = R .* cos(Theta);
Y0 = R .* sin(Theta);

% Using the constraint given by Questions
% unit_circle = X0.^2 + Y0.^2 <= 1;
% hole_center = [0.3, 0.3];
% hole_radius = 0.3;
hole = ((X0 - 0.3).^2 + (Y0 - 0.3).^2) <= 0.3^2;
% Using the given function here
f = exp(-81/4 * (X0.^2 + Y0.^2));
% Set values inside the hole to NaN
f(hole) = NaN;

% Perform interpolation for a smoother plot
% [X, Y] = meshgrid(linspace(min(X0(:)), max(X0(:)), 150), linspace(min(Y0(:)), max(Y0(:)), 150));
% Z = griddata(X0(:), Y0(:), f(:), X, Y, 'cubic');

% Plotting the smoothed surface with a red color
figure (1)
%surf(X, Y, Z, 'FaceAlpha', 0.7);
surf(X0, Y0, f, 'FaceAlpha', 0.9,'EdgeColor','none');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Smoothed Surface');
axis equal;view(10,20);
colorbar;
%grid on;
