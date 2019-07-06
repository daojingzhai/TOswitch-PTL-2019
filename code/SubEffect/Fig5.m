% Using this program to plot Fig.5 
% If there is any question, feel free to contact Daojing via
% daojing.zhai@gmail.com

clc
clear

%% Coefficient

Kappa_SiO2 = 1.4e-03; % Heat transfer coefficience
Kappa_Si = 149.2e-03; % Sub Heat transfer coefficience
W_H = 4; % W_H(um)
L_H = 100; % L_H(um)
t_cox = 2;
t_box = 2;
t_core = 0.22;
d = t_cox+t_box+t_core;
num = 21; % points number
items_num = 20; % number of series items. 
P = 1; % Heater power
T = ones(1,num);
Z = 0:d/(num-1):d;

%% Load simulation results
load('Simulation.mat');

%% Theory without substrate
for j = 1:num
    T(j) = Delta_T_fn(items_num,Z(j),d,P,Kappa_SiO2,W_H,L_H);
end

% plotting
plot (Z,T,'-r','LineWidth', 2);
hold on

%% substrate effect
% Based on Eq.(2) of Song 2013 OE
L_H_tosub = L_H+2*d; % length of "imagine heater" above sub
W_H_tosub = W_H+2*d; % width of "imagine heater" above sub
d_sub = 500; % sub thickness
u_dsub = sqrt((L_H_tosub/2)^2+(W_H_tosub/2)^2+d_sub^2); % u(z=d_sub)
u_0 = sqrt((L_H_tosub/2)^2+(W_H_tosub/2)^2); % u(z=0)
dt_sub = 2*P/W_H_tosub/L_H_tosub/pi/Kappa_Si...
    * (d_sub*atan((L_H_tosub/2)*(W_H_tosub/2)/d_sub/u_dsub)...
    - (L_H_tosub/2)*acoth(u_dsub/(W_H_tosub/2))...
    - (W_H_tosub/2)*acoth(u_dsub/(L_H_tosub/2))...
    + (L_H_tosub/2)*acoth(u_0/(W_H_tosub/2))...
    + (W_H_tosub/2)*acoth(u_0/(L_H_tosub/2)));
T_revised = T+dt_sub;
plot(Z,T_revised,'-b','LineWidth', 2);

%% Plot simulation results
plot(y_500sub,u_500sub_y,':b');
plot(y_20sub,u_20sub_y,':r');
xlabel('z(\mum)')
ylabel('\DeltaT/P(K/mW)')
axis([0 4 0 5])
legend({'Theory no sub','Theory with sub','Simulation 20um Sub','Simulation 50um Sub'})
hold off