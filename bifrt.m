% Final outcome differences for different values of theta and r
% Used to determine range of r and theta values to use
I = 0.8;
del = 0.4;
alpha = 0.5;
%thetaVec = 1:3/15:4;
thetaVec = 1:1/15:2; % length is 16... 16 possible theta values
rvec = 1.5:2.5/15:4;
%rvec = 1:3/15:4;
winDiff = zeros(16,16); % matrix the difference between the two populations at the end
x0 = [.2 .2];
figure;
tspan = [0 120];
w2 = 0;
tau = 1;
for (i =1:16)
    theta = thetaVec(i);
    for(j = 1:16)
        r = rvec(j);
        [t, x] = ode45(@(t,x) compfun(t,x,r,theta,alpha,I,del,tau,w2),tspan,x0);
        xvec=x(:,1); % all the x-values
        yvec=x(:,2); % all the y-values
        xfinal = xvec(end);
        yfinal = yvec(end);
        diff = yfinal - xfinal;
        winDiff(i,j) = diff; % fills from bottom row to top row, and from left to right
        if diff > 0.8
            top = ['r = ', num2str(r), ' theta = ', num2str(theta)];
        end
        
    end
end

im = imagesc([1.5,4],[1,2],winDiff);
%im = imagesc([1,4],[1,4],winDiff);
xlabel('r');
ylabel('\theta');
title(['Difference y - x when \alpha = ', num2str(alpha), ', \delta = ', num2str(del), ', and I = ', num2str(I)]);
colorbar