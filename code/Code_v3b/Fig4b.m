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
item_num = 10; % item number
lambda = 1.628;
Si_coeff = 1.86*1e-4;
P = 1; % unit power

%% Heater linspace
l = [8:5:80 100:100:1000]; % L_H
w = linspace(0.2,8,20); % W_H

%% calculation
llen = length(l);
wlen = length(w);

% 2D
% p = zeros(llen,1);
% w0 = 2;
% for item_num = 1:6
% % for i = 1:wlen
%     for j = 1:llen
%     %         p(i,j) = lambda/2/Si_coeff...
%     %             ./integral(@(y)Delta_T_fn_3D(item_num,0,y,z,d,P,Kappa,w(i),l(j)),-l(j)/2,l(j)/2);
%         p(j) = integral(@(y)Delta_T_fn_3D(item_num,0,y,z,d,P,Kappa,w0,l(j)),-l(j)/2,l(j)/2,'RelTol',1e-12,'AbsTol',1e-18);
%     %     end
%     end
%     plot(l,p)
%     hold on
% end

p = zeros(wlen,llen);
for i = 1:wlen
    for j = 1:llen
        p(i,j) = lambda/2/Si_coeff...
            ./integral(@(y)Delta_T_fn_3D(item_num,0,y,z,d,P,Kappa,w(i),l(j)),...
            -l(j)/2,l(j)/2);
    end
end


%% plot figure
figure;
surf(l,w,p);
xticks([10 200:200:1000])
ylim([0.2 9])
zlim([20 48])
yticks([0.5 2:2:8])
xlabel('L_H(\mum)')
ylabel('W_H(\mum)')
zlabel('P_\pi(mW)')
