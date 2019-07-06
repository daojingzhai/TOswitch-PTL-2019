% Using this program plotting Fig.4(b) 
% If there is any question, feel free to contact Daojing via
% daojing.zhai@gmail.com

clc
clear

%% Coefficient
T = 1; % unit temperature
Kappa = 1.4e-03; % Heat transfer coefficience
w = 4; % W_H=4um
l = 100; % L_H=100um
tcore = 0.5; % tcore = 500nm
item_num = 50; % item number
lambda = 1.628; % wavelength = 1.628um
Si_coeff = 1.86*1e-4;
P = 1; % power unit
%% Linspace of cover and box, grid
tcox = 0.2:0.2:3; % t_cox
tbox = 0.4:0.2:5; % t_box

%% calculation
ltcox = length(tcox);
ltbox = length(tbox);
p = zeros(ltbox, ltcox);

for i = 1:ltbox
    for j = 1:ltcox
        p(i,j) = lambda/2/Si_coeff...
            ./integral(@(y)Delta_T_fn_3D(item_num,0,y,tcox(j)+tcore/2,tcox(j)+tcore+tbox(i),P,Kappa,w,l),-l/2,l/2);
    end
end

%% Plot figure
figure;
surf(tcox,tbox,p);
xlabel('t_{cox}(\mum)')
ylabel('t_{box}(\mum)')
xlim([0 3]);
ylim([0 6]);
zlim([0 100]);
zlabel('P_\pi(mW)')
