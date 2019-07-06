% Using this program plotting Fig.3(e) 
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
Z = 0:0.05:d; % z

%% calculation
lz = length(Z); 
T = zeros(lz,1);

for j = 1:lz
    T(j) = Delta_T_fn_3D(charge_pairs,0,0,Z(j),d,P,Kappa,W_H,L_H);    
end


%% Plot figure
figure;
plot(T);
xlabel('z(\mum)')
ylabel('\DeltaT/P(K/mW)')

