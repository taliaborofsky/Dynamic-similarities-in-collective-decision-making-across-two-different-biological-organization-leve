function [ F] = root2del( x,r,th,alpha ,I,tau,del)



F(1) = (-x(1)+ SigmoidalGain(x(1)-x(2)+(1+alpha)*I- del,r,th))/tau;
F(2)=(-x(2) +SigmoidalGain(x(2)-x(1)+(1-alpha)*I,r,th))/tau;


end

%helper function for root-finding in computing the FPs during stop signal
%interval
