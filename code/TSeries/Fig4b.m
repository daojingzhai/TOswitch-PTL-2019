% Using this program plotting Fig.4(b) 
% If there is any question, feel free to contact Daojing via
% daojing.zhai@gmail.com

clc
clear

%% Coefficient
T = 1; % unit temperature
Kappa = 1.4e-03; % Heat transfer coefficience
z = 2.11; % Place of silicon core
d = 4.22; % t_cox+t_box+t_core
item_num1 = 200; % item number
item_num2 = 20; % item number
lambda = 1.628;
Si_coeff = 1.86*1e-4;
P = 1; % unit power
%% Heater linspace
l = [20:10:100 100:50:1000]; % L_H
w = linspace(0.5,8,51); % W_H
%% calculation
llen = length(l);
wlen = length(w);
p = zeros(wlen, llen);

for i = 1:wlen
    for j = 1:llen
        if l(j)<110
             p(i,j) = lambda/2/Si_coeff...
                 ./integral(@(y)Delta_T_fn_3D(item_num2,0,y,z,d,P,Kappa,w(i),l(j)),-l(j)/2,l(j)/2);
        else
            p(i,j) = lambda/2/Si_coeff...
                ./integral(@(y)Delta_T_fn_3D(item_num2,0,y,z,d,P,Kappa,w(i),l(j)),-l(j)/2,l(j)/2);
        end
    end
end

%% plot figure
figure;
surf(l,w,p);
xticks([50 200:200:1000])
yticks([0.5 2:2:8])
xlabel('L_H(\mum)')
ylabel('W_H(\mum)')
zlabel('P_\pi(mW)')
