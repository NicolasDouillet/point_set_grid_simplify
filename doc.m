%% point_set_grid_simplify
%
% Function to grid simplify a point set.
%
% Author & support : nicolas.douillet (at) free.fr, 2019-2020.
%
%% Syntax
%
% V_out = point_set_grid_simplify(V_in, grid_step);
%
% V_out = point_set_grid_simplify(V_in, grid_step, version);
%
%% Description
%
% V_out = point_set_grid_simplify(V_in, grid_step) simplifies the input
% point set V_in through the 3D cubic grid of step grid_step and return
% the result V_out.
%
% V_out = point_set_grid_simplify(V_in, grid_step, version) follows version option
% *'exact'/'rounded' for the simplification process.
%
% In the exact version, every vertex of V_out also belong to V_in set : for each cell of the grid
% the closest to the cell centre is kept,
%
% whereas rounded version is an approximation (for each cell of the grid, the corresponding vertex cluster is
% replaced with the cell centre) though sometimes usefull because very fast.
%
%% See also
%
% <https://fr.mathworks.com/matlabcentral/fileexchange/73661-point-set-random-simplify point_set_random_simplify> |
% <https://fr.mathworks.com/help/matlab/ref/colon.html?s_tid=srchtitle colon> |
% <https://fr.mathworks.com/help/matlab/ref/linspace.html linspace>
%
%% Input arguments
%
%           [ |  |  |]
% - V_in = [Vx Vy Vz], real matrix double, the input point set, size(V_in) = [nb_vertices_in,3].
%           [ |  |  |]
%
% - grid_step : positive integer scalar double, the step of the grid.
%
% - version : character string in the set {*'exact','rounded'}. Case insensitive.
%
%% Output arguments
%
%            [ |  |  |]
% - V_out = [Vx Vy Vz], real matrix double, the output point set, size(V_out) = [nb_vertices_out,3].
%            [ |  |  |]
%
%% Example
% 
% Unit ball sampling
%
N = 1e4;
X = 2*(rand(N,1)-0.5);
Y = 2*(rand(N,1)-0.5);
Z = 2*(rand(N,1)-0.5);

Rho = X.^2 + Y.^2 + Z.^2;
i = Rho <= 1;
X = X(i);
Y = Y(i);
Z = Z(i);

M = [X, Y, Z];
grid_step = 0.2;
N = point_set_grid_simplify(M, grid_step);

figure;
subplot(121);
plot3(X,Y,Z,'.','Color',[0 0 1],'Linewidth',2), hold on;
axis equal, view(2);
title({'Input raw point set',cat(2,num2str(size(M,1)),' vertices')});

subplot(122);
plot3(N(:,1), N(:,2), N(:,3),'.','Color',[0 0 1],'Linewidth',2), hold on;
axis equal, view(2);
title({'Output grid sampled point set',cat(2,'grid step = ', num2str(grid_step),' ; ',num2str(size(N,1)),' vertices')});