function [ F] =  jacdel( x,r,th,alpha ,I,tau,del,w2)



F(1,1) = (-1+ r*SigmoidalGain(x(1)-x(2)+(1+alpha)*I-del,r,th) * (1-SigmoidalGain(x(1)-x(2)+(1+alpha)*I-w2*del,r,th)))/tau;
F(1,2) =  (-1*r*SigmoidalGain(x(1)-x(2)+(1+alpha)*I-del,r,th) * (1-SigmoidalGain(x(1)-x(2)+(1+alpha)*I-w2*del,r,th)))/tau;
F(2,1)= (-1*r*SigmoidalGain(x(2)-x(1)+(1-alpha)*I,r,th) * (1- SigmoidalGain(x(2)-x(1)+(1-alpha)*I,r,th)))/tau;
F(2,2)= (-1 + r*SigmoidalGain(x(2)-x(1)+(1-alpha)*I,r,th) * (1- SigmoidalGain(x(2)-x(1)+(1-alpha)*I,r,th)))/tau;




%-x(2) +SigmoidalGain(x(2)-x(1)+(1-alpha)*I,r,th);


end

%computes jacobian matrix for linear stability analysis with switch