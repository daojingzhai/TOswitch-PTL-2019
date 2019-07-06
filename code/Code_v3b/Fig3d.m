% Using this program to plot Fig.3(d) 
% If there is any question, feel free to contact Daojing via
% daojing.zhai@gmail.com

clc
clear

%% Coefficient
Kappa = 1.4e-03; % Heat transfer coefficience
W_H = 4; % W_H(um)
L_H = 150; % L_H(um)
d = 4.22; % t_cox+t_box+t_core
L = 200;
W = 150;
num = 51; % points number
charge_pairs = 20; % number of series items. 
P = 1; % Heater power
T = ones(num,num);
X = -W/2:W/(num-1):W/2;
Y = -L/2:L/(num-1):L/2;

%% calculate temperature in different depths
tic
for i = 1:num
    for j = 1:num
        T(i,j) = Delta_T_fn_3D(charge_pairs,X(i),Y(j),0,d,P,Kappa,W_H,L_H);
    end
end
toc

%% plotting
figure
surf(Y,X,T);
xlabel('y(\mum)')
ylabel('x(\mum)')
zlabel('\DeltaT/P(K/mW)')
zlim([-.02 3.5])
xlim([-100 100])
ylim([-75 75])
colorbar
s.EdgeColor = 'none';
grid off
shading interp
