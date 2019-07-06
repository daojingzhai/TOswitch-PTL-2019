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
item_num1 = 1; 
item_num2 = 10; % item number
lambda = 1.628; % wavelength = 1.628um
Si_coeff = 1.86*1e-4;

%% Linspace of cover and box, grid
tcox = 0.2:0.2:3; % t_cox
tbox = 0.4:0.2:5; % t_box

%% calculation
ltcox = length(tcox);
ltbox = length(tbox);
error = zeros(ltbox, ltcox);

for i = 1:ltbox
    for j = 1:ltcox
        temp1 = (-1)^(item_num1-1)*gamma_interm_fn(item_num1,tcox(j)+tcore/2,tcox(j)+tbox(i)+tcore,w,l);
        temp2 = 0;
        for k = 1:item_num2
            temp2 = temp2+(-1)^(k-1)*gamma_interm_fn(k,tcox(j)+tcore/2,tcox(j)+tbox(i)+tcore,w,l);
        end
        error(i,j) = 1-temp2/temp1;

    end
end

%% Plot figure
figure;
surfc(tcox,tbox,error);
xlabel('t_{cox}(\mum)')
ylabel('t_{box}(\mum)')
zlabel('error')
% saveas(gcf,'Error_t.fig')