function [ F] = root2d( x,r,th,alpha ,I, tau)


F(1) = (-x(1)+ SigmoidalGain(x(1)-1*x(2)+(1+alpha)*I,r,th))/tau;
F(2)=(-x(2) +SigmoidalGain(x(2)-1*x(1)+(1-alpha)*I,r,th))/tau;


end

%helper function for root-finding in computing the FPs

