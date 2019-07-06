% Using this program plotting Fig.3(a)(b) 
% If there is any question, feel free to contact Daojing via
% daojing.zhai@gmail.com

clc
clear
cross_section = readtable('cross_section.txt');
surface = readtable('surface.txt');

%% Cross_section
x_c = cross_section(:,1);
z_c = cross_section(:,2);
T_c = cross_section(:,3);
x_c = table2array(x_c);
z_c = table2array(z_c);
T_c = table2array(T_c);
[X,Y,Z1] = griddata(x_c,z_c,T_c,linspace(min(x_c),max(x_c),200)',linspace(min(z_c),max(z_c),200),'natural');
X = X*1e6;
Y = 4.22-Y*1e6;
Z1 = Z1-273.14;

% figure
% pcolor(X,Y,Z);
% set(gca,'Xdir','reverse')
% shading interp;
% xlabel('x(\mum)')
% ylabel('z(\mum)')

figure
h = surf(X,Y,Z1);
set(gca,'Ydir','reverse')
xlabel('x(\mum)')
ylabel('z(\mum)')
zlabel('\DeltaT/P(K/mW)')
xlim([-75 75]);
ylim([0 24.22])
zlim([0 3.5])
colorbar
shading interp;
EdgeColor = 'none';
grid off
set(h,'edgecolor','none')

%% Surface
x_s = surface(:,1);
y_s = surface(:,2);
T_s = surface(:,3);
x_s = table2array(x_s);
y_s = table2array(y_s);
T_s = table2array(T_s);
[X,Y,Z2] = griddata(x_s,y_s,T_s,linspace(min(x_s),max(x_s),200)',linspace(min(y_s),max(y_s),200),'natural');
X = X*1e6;
Y = Y*1e6;
Z2 = Z2-273.14;

% figure
% pcolor(Y,X,Z);
% shading interp
% xlabel('y(\mum)')
% ylabel('x(\mum)')

figure
h = surf(Y,X,Z2);
shading interp;
xlabel('y(\mum)')
ylabel('x(\mum)')
zlabel('\DeltaT/P(K/mW)')
zlim([0 3.5])
xlim([-100 100])
ylim([-75 75])
colorbar
set(h,'edgecolor','none');
grid off

