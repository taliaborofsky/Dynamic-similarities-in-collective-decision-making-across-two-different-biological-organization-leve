%Function for dynamics
%@inputs: time, vec of current populations, r, theta, alpha, I, delta, tau,
%and relative mag of wave 2
function [ F] = compfun( t,x, r,th,alpha ,I,del,tau,w2)

F = zeros(2,1);
% if(t>60 && alpha >0)
%     alpha = -1*alpha
% end
% if(t>60)
%     r=3;
% end
F(1) = -x(1)+ SigmoidalGain(x(1)-x(2)+(1+alpha)*I -...
    del*(heaviside(t-60) - heaviside(t-70)) - del*w2*(heaviside(t-90)- heaviside(t-100)),r,th);
F(2)=-x(2) + SigmoidalGain(x(2)-x(1)+(1-alpha)*I,r,th);
F(1) = F(1)/tau; F(2) = F(2)/tau;
end