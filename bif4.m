% - ending difference between x and y vs delta for taus of different values... 
% and different omega/delta ratios
I = 0.8; r = 3; th = 1; alpha = 0.01; del = 0.4;
w2ratio = 0:0.1:1;
tau_vec =[1 10 20];
tau_vec(1) = 1;
tf = 500;
tspan = [0 tf];
x0 = [.2 .2];
f1 = figure;
winDiff = zeros(1,length(w2ratio));
tau = 1;
for j = 1:length(w2ratio) 
        w2 = w2ratio(j);
        [t, x] = ode45(@(t,x) compfun(t,x,r,th,alpha,I,del,tau,w2),tspan,x0);
        xfinal = x(end,1);
        yfinal = x(end,2);
        diff = xfinal - yfinal;
        winDiff(j) = diff;
end
plot(w2ratio,winDiff,'-*');
hold on
tau = 10;
for j = 1:length(w2ratio) 
        w2 = w2ratio(j);
        [t, x] = ode45(@(t,x) compfun(t,x,r,th,alpha,I,del,tau,w2),tspan,x0);
        xfinal = x(end,1);
        yfinal = x(end,2);
        diff = xfinal - yfinal;
        winDiff(j) = diff;
end
plot(w2ratio,winDiff,'-s');
hold on
tau = 20;
for j = 1:length(w2ratio) 
        w2 = w2ratio(j);
        [t, x] = ode45(@(t,x) compfun(t,x,r,th,alpha,I,del,tau,w2),tspan,x0);
        xfinal = x(end,1);
        yfinal = x(end,2);
        diff = xfinal - yfinal;
        winDiff(j) = diff;
end
plot(w2ratio,winDiff,'-o');
legend('\tau = 1','\tau = 10','\tau = 20')
xlabel('Second Stop Signal Strength \omega / \delta');
ylabel('Long-Time Difference x - y');
ax = gca;
ax.Box = 'off';
set(ax,'FontSize',20,'FontName','times');
set(findall(ax,'Type','Line'),'LineWidth',2,'markersize',10)


