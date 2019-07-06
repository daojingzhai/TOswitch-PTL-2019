% Using this program plotting Fig.3(b) 
% If there is any question, feel free to contact Daojing via
% daojing.zhai@gmail.com

clc
clear
%% Parameters
Kappa = 1.4e-03; % Heat transfer coefficience
W_H = 4; % W_H(um)
L_H = 150; % L_H(um)
d = 4.22; % t_cox+t_box+t_core
charge_pairs = 20; % number of series items. 
P = 1; % Unit heat power

%% Linspace of x and z
X = -75:0.9:75; % x
Z = 0:0.2:d; % z

%% calculation
lx = length(X); 
lz = length(Z); 
T = zeros(lx, lz);

tic
for i = 1:lx
    for j = 1:lz
        T(i,j) = Delta_T_fn_3D(charge_pairs,X(i),0,Z(j),d,P,Kappa,W_H,L_H);    
    end
end
toc

%% Add substrate layer
T = [T zeros(lx,length(-20:0.2:-0.2))];
Z1 = [-20:0.2:-0.2 Z];

%% Plot figure
Z1 = Z1+20;
figure;
surfc(X,Z1,T');
xlabel('x(\mum)')
ylabel('z(\mum)')
zlabel('\DeltaT/P(K/mW)')
set(gca,'Ydir','reverse')
zlim([-0.02 3.5])
colorbar
s.EdgeColor = 'none';
grid off
shading interp

