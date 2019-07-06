function [Delta_T] = Delta_T_fn_3D(n,x,y,z,d,P,kappa,W_H,L_H)
% This function calculate Delta_T_3D, based on Eq.(4)
% W_H, L_H: width & length of waveguide
% n: calculated terms in the series
% x,y,z: (x,y,z) point to be analized
% d: t_cox + t_box + t_core
% P: Heater power

temp = 0;

for i=1:n
    temp = temp + (-1)^(i-1)*gamma_interm_3D_fn(i,x,y,z,d,W_H,L_H);
end

Delta_T = 2*P/pi/kappa/W_H/L_H*temp;
end

function [output] = gamma_interm_3D_fn(i,x,y,z,d,W_H,L_H)
% This function calculates the value of Eq.(3)
% W_H, L_H: width & length of waveguide
% i: current term in the series
% x,y,z: (x,y,z)
% d: t_cox + t_box + t_core

    function [output_interm] = I_fn(x,y)
        % numerical integral
        output_interm = 1/4*integral(@(x0) asinh(abs(L_H/2-y)./abs(x0-x))-asinh(abs(-L_H/2-y)./abs(x0-x)),...
            -W_H/2,W_H/2);
        % analytical integral
%         output_interm = 1/4*(abs(W_H/2-x)*asinh(abs(L_H/2-y)/abs(W_H/2-x))...
%             + abs(L_H/2-y).*asinh(abs(W_H/2-x)./abs(L_H/2-y))...
%             - abs(W_H/2-x)*asinh(abs(-L_H/2-y)/abs(W_H/2-x))...
%             - abs(-L_H/2-y).*asinh(abs(W_H/2-x)./abs(-L_H/2-y)));
    end

output = I_fn(x,y) - I_fn(0,0) + (gamma_interm_fn(i,z,d,W_H-2*x,L_H-2*y)...
    - gamma_interm_fn(i,z,d,-W_H-2*x,L_H-2*y)...
    - gamma_interm_fn(i,z,d,W_H-2*x,-L_H-2*y)...
    + gamma_interm_fn(i,z,d,-W_H-2*x,-L_H-2*y))/4;

end