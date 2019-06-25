function fx = SigmoidalGain(x,r,theta)
u = r*(x - theta);
fx = 1./(1+exp(-u));
end