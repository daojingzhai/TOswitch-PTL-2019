% Using this program plotting error on different L_H and W_H condition  
% If there is any question, feel free to contact Daojing via
% daojing.zhai@gmail.com

clc
clear

%% Coefficient
T = 1; % unit temperature
Kappa = 1.4e-03; % Heat transfer coefficience
z = 2.11; % Place of silicon core
d = 4.22; % t_cox+t_box+t_core
item_num1 = 1; 
item_num2 = 10; % item number
lambda = 1.628;
Si_coeff = 1.86*1e-4;

%% Heater linspace
l = [20 50 100:50:1000]; % L_H
w = linspace(0.5,8,51); % W_H

%% calculation
llen = length(l);
wlen = length(w);
error = zeros(wlen, llen);

for i = 1:wlen
    for j = 1:llen
        temp1 = (-1)^(item_num1-1)*gamma_interm_fn(item_num1,z,d,w(i),l(j));
        temp2 = 0;
        for k = 1:item_num2
            temp2 = temp2+(-1)^(k-1)*gamma_interm_fn(k,z,d,w(i),l(j));
        end
        error(i,j) = 1-temp2/temp1;
    end
end

%% plot figure
figure;
surfc(l,w,error);
xlabel('L_H(\mum)')
ylabel('W_H(\mum)')
zlabel('Error(mW)')
% saveas(gcf,'Error_LW.fig')