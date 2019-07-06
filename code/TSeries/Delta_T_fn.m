function [Delta_T] = Delta_T_fn(n,z,d,P,kappa,W_H,L_H)
% This function calculate Delta_T, based on Eq.(5)
% W_H, L_H: width & length of waveguide
% n: calculated terms in the series
% z: place of silicon core
% d: t_cox + t_box + t_core
% P: Heater power

temp = 0;
for i=1:n
    temp = temp + (-1)^(i-1)*gamma_interm_fn(i,z,d,W_H,L_H);
end

Delta_T = 2*P/pi/kappa/W_H/L_H*temp;

end 