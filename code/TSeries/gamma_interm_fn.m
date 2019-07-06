function [output] = gamma_interm_fn(i,z,d,W_H,L_H)
% This function calculates the value of Eq.(4)
% W_H, L_H: width & length of waveguide
% i: current term in the series
% z: place of silicon core
% d: t_cox + t_box + t_core

    function [nu_z] = nu(z_prime)
    % This function calculates the value of nu(z)         
        nu_z = sqrt((L_H/2).^2+(W_H/2)^2+z_prime^2);
    end

z1 = 2*i*d-z;
z2 = 2*(i-1)*d+z;

dummy1 = (z1*atan((L_H/2)*(W_H/2)/z1/nu(z1))...
    -(L_H/2).*acoth(nu(z1)/(W_H/2))-(W_H/2)*acoth(nu(z1)./(L_H/2)));
dummy2 = (z2*atan((L_H/2)*(W_H/2)/z2/nu(z2))...
    -(L_H/2).*acoth(nu(z2)/(W_H/2))-(W_H/2)*acoth(nu(z2)./(L_H/2)));
output = dummy1-dummy2;

end