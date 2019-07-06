% Using this program plotting Fig.3(e) upper insert.
% If there is any question, feel free to contact Daojing via
% daojing.zhai@gmail.com

clc
clear

%% Coefficient
Kappa = 1.4e-03; % Heat transfer coefficience
W_H = 4; % W_H(um)
L_H = 100; % L_H(um)
z = 2.11; % t_cox+1/2*t_core
d = 4.22; % t_cox+t_box+t_core
num = 21; % number of points 
items_num = 30; % number of series items. 
P = 1; % Heater power
T = ones(1,num);
I = 1:items_num;

%% calculate series items
for i = 1:items_num
    T(i) = 2*P/pi/Kappa/W_H/L_H*(-1)^(i-1)*gamma_interm_fn(i,z,d,W_H,L_H);
end

%% plotting
plot(I,T);
xlabel('i')
ylabel('\DeltaT/P(K/mW)')
axis([0 20 -1 2.5])